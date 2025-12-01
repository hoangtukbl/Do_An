import { useState, useEffect } from 'react';
import AdminLayout from '../../components/AdminLayout';
import axios from 'axios';

export default function AdminHouses() {
  const [houses, setHouses] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filterStatus, setFilterStatus] = useState('All'); // All, Pending, Approved, Rejected
  const [filterHouseStatus, setFilterHouseStatus] = useState('All'); // All, Available, Sold, Rented
  const [searchQuery, setSearchQuery] = useState('');
  const [priceMin, setPriceMin] = useState('');
  const [priceMax, setPriceMax] = useState('');
  const [areaMin, setAreaMin] = useState('');
  const [areaMax, setAreaMax] = useState('');
  const [showAdvancedFilters, setShowAdvancedFilters] = useState(false);
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalHouses, setTotalHouses] = useState(0);
  const [showRejectModal, setShowRejectModal] = useState(false);
  const [selectedHouse, setSelectedHouse] = useState(null);
  const [rejectReason, setRejectReason] = useState('');
  const [showDetailModal, setShowDetailModal] = useState(false);
  const [houseDetail, setHouseDetail] = useState(null);
  const [isEditMode, setIsEditMode] = useState(false);
  const [editForm, setEditForm] = useState({});
  const pageSize = 10;

  useEffect(() => {
    fetchHouses();
  }, [filterStatus, filterHouseStatus, currentPage]);

  const fetchHouses = async () => {
    setLoading(true);
    try {
      const token = localStorage.getItem('token');
      let url = `http://localhost:3001/api/admin/houses?page=${currentPage}&pageSize=${pageSize}`;
      
      if (filterStatus !== 'All') {
        url += `&approvalStatus=${filterStatus}`;
      }
      
      if (filterHouseStatus !== 'All') {
        url += `&status=${filterHouseStatus}`;
      }
      
      const response = await axios.get(url, {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      
      let data = response.data.data || [];
      
      // Client-side filtering for search and price/area
      if (searchQuery) {
        const query = searchQuery.toLowerCase();
        data = data.filter(house =>
          house.Title?.toLowerCase().includes(query) ||
          house.Address?.toLowerCase().includes(query) ||
          house.HouseID?.toString().includes(query)
        );
      }
      
      if (priceMin) {
        data = data.filter(house => house.Price >= parseInt(priceMin));
      }
      
      if (priceMax) {
        data = data.filter(house => house.Price <= parseInt(priceMax));
      }
      
      if (areaMin) {
        data = data.filter(house => house.Area >= parseFloat(areaMin));
      }
      
      if (areaMax) {
        data = data.filter(house => house.Area <= parseFloat(areaMax));
      }
      
      setHouses(data);
      setTotalPages(response.data.totalPages || 1);
      setTotalHouses(data.length);
    } catch (error) {
      console.error('Error fetching houses:', error);
      alert('Lỗi khi tải danh sách nhà');
    } finally {
      setLoading(false);
    }
  };

  const handleSearch = () => {
    setCurrentPage(1);
    fetchHouses();
  };

  const handleClearFilters = () => {
    setSearchQuery('');
    setPriceMin('');
    setPriceMax('');
    setAreaMin('');
    setAreaMax('');
    setFilterStatus('All');
    setFilterHouseStatus('All');
    setCurrentPage(1);
  };

  const handleApprove = async (houseId) => {
    if (!confirm('Bạn có chắc muốn duyệt nhà này?')) return;
    
    try {
      const token = localStorage.getItem('token');
      await axios.put(
        `http://localhost:3001/api/admin/houses/${houseId}/approve`,
        {},
        { headers: { 'Authorization': `Bearer ${token}` } }
      );
      
      alert('Đã duyệt nhà thành công!');
      fetchHouses();
    } catch (error) {
      console.error('Error approving house:', error);
      alert('Lỗi khi duyệt nhà: ' + (error.response?.data?.message || error.message));
    }
  };

  const handleRejectClick = (house) => {
    setSelectedHouse(house);
    setRejectReason('');
    setShowRejectModal(true);
  };

  const handleRejectSubmit = async () => {
    if (!rejectReason.trim()) {
      alert('Vui lòng nhập lý do từ chối');
      return;
    }
    
    try {
      const token = localStorage.getItem('token');
      await axios.put(
        `http://localhost:3001/api/admin/houses/${selectedHouse.HouseID}/reject`,
        { reason: rejectReason },
        { headers: { 'Authorization': `Bearer ${token}` } }
      );
      
      alert('Đã từ chối nhà thành công!');
      setShowRejectModal(false);
      fetchHouses();
    } catch (error) {
      console.error('Error rejecting house:', error);
      alert('Lỗi khi từ chối nhà: ' + (error.response?.data?.message || error.message));
    }
  };

  const handleDelete = async (houseId) => {
    if (!confirm('Bạn có chắc muốn XÓA nhà này? Hành động này không thể hoàn tác!')) return;
    
    try {
      const token = localStorage.getItem('token');
      await axios.delete(
        `http://localhost:3001/api/admin/houses/${houseId}`,
        { headers: { 'Authorization': `Bearer ${token}` } }
      );
      
      alert('Đã xóa nhà thành công!');
      fetchHouses();
    } catch (error) {
      console.error('Error deleting house:', error);
      alert('Lỗi khi xóa nhà: ' + (error.response?.data?.message || error.message));
    }
  };

  const handleViewDetail = async (houseId) => {
    try {
      const token = localStorage.getItem('token');
      const response = await axios.get(
        `http://localhost:3001/api/admin/houses/${houseId}`,
        { headers: { 'Authorization': `Bearer ${token}` } }
      );
      
      setHouseDetail(response.data);
      setEditForm(response.data.house);
      setIsEditMode(false);
      setShowDetailModal(true);
    } catch (error) {
      console.error('Error fetching house detail:', error);
      alert('Lỗi khi tải thông tin nhà: ' + (error.response?.data?.message || error.message));
    }
  };

  const handleEditSubmit = async () => {
    try {
      const token = localStorage.getItem('token');
      await axios.put(
        `http://localhost:3001/api/admin/houses/${houseDetail.house.HouseID}`,
        editForm,
        { headers: { 'Authorization': `Bearer ${token}` } }
      );
      
      alert('Cập nhật thông tin nhà thành công!');
      setShowDetailModal(false);
      fetchHouses();
    } catch (error) {
      console.error('Error updating house:', error);
      alert('Lỗi khi cập nhật: ' + (error.response?.data?.message || error.message));
    }
  };

  const handleDeleteImage = async (imageId) => {
    if (!confirm('Bạn có chắc muốn xóa hình ảnh này?')) return;
    
    try {
      const token = localStorage.getItem('token');
      await axios.delete(
        `http://localhost:3001/api/admin/houses/${houseDetail.house.HouseID}/images/${imageId}`,
        { headers: { 'Authorization': `Bearer ${token}` } }
      );
      
      alert('Đã xóa hình ảnh thành công!');
      // Reload detail
      handleViewDetail(houseDetail.house.HouseID);
    } catch (error) {
      console.error('Error deleting image:', error);
      alert('Lỗi khi xóa hình ảnh: ' + (error.response?.data?.message || error.message));
    }
  };

  const handleSetCoverImage = async (imageId) => {
    try {
      const token = localStorage.getItem('token');
      await axios.put(
        `http://localhost:3001/api/admin/houses/${houseDetail.house.HouseID}/images/${imageId}/set-cover`,
        {},
        { headers: { 'Authorization': `Bearer ${token}` } }
      );
      
      alert('Đã đặt làm ảnh bìa!');
      // Reload detail
      handleViewDetail(houseDetail.house.HouseID);
    } catch (error) {
      console.error('Error setting cover image:', error);
      alert('Lỗi khi đặt ảnh bìa: ' + (error.response?.data?.message || error.message));
    }
  };

  const handleQuickStatusChange = async (houseId, newStatus) => {
    if (!confirm(`Bạn có chắc muốn đổi trạng thái thành "${newStatus}"?`)) return;
    
    try {
      const token = localStorage.getItem('token');
      await axios.put(
        `http://localhost:3001/api/admin/houses/${houseId}/status`,
        { status: newStatus },
        { headers: { 'Authorization': `Bearer ${token}` } }
      );
      
      alert(`Đã đổi trạng thái thành ${newStatus}!`);
      if (showDetailModal) {
        handleViewDetail(houseId);
      } else {
        fetchHouses();
      }
    } catch (error) {
      console.error('Error changing status:', error);
      alert('Lỗi khi đổi trạng thái: ' + (error.response?.data?.message || error.message));
    }
  };

  const getStatusBadge = (status) => {
    const styles = {
      Pending: 'bg-yellow-100 text-yellow-800 border-yellow-300',
      Approved: 'bg-green-100 text-green-800 border-green-300',
      Rejected: 'bg-red-100 text-red-800 border-red-300'
    };
    
    const labels = {
      Pending: '⏳ Chờ duyệt',
      Approved: '✅ Đã duyệt',
      Rejected: '❌ Từ chối'
    };
    
    return (
      <span className={`px-3 py-1 rounded-full text-sm font-medium border ${styles[status]}`}>
        {labels[status]}
      </span>
    );
  };

  const formatPrice = (price) => {
    return new Intl.NumberFormat('vi-VN', {
      style: 'currency',
      currency: 'VND'
    }).format(price);
  };

  const formatDate = (dateString) => {
    if (!dateString) return 'N/A';
    return new Date(dateString).toLocaleString('vi-VN');
  };

  return (
    <AdminLayout>
      <div className="p-6">
        {/* Header */}
        <div className="mb-6">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">Quản lý Nhà</h1>
          <p className="text-gray-600">Duyệt và quản lý các nhà đăng bán trên hệ thống</p>
        </div>

        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
          <div className="bg-white rounded-lg shadow p-4 border-l-4 border-yellow-500">
            <div className="text-sm text-gray-600">Chờ duyệt</div>
            <div className="text-2xl font-bold text-gray-900">{totalHouses}</div>
          </div>
          <div className="bg-white rounded-lg shadow p-4 border-l-4 border-green-500">
            <div className="text-sm text-gray-600">Đã duyệt</div>
            <div className="text-2xl font-bold text-gray-900">-</div>
          </div>
          <div className="bg-white rounded-lg shadow p-4 border-l-4 border-red-500">
            <div className="text-sm text-gray-600">Từ chối</div>
            <div className="text-2xl font-bold text-gray-900">-</div>
          </div>
          <div className="bg-white rounded-lg shadow p-4 border-l-4 border-blue-500">
            <div className="text-sm text-gray-600">Tổng cộng</div>
            <div className="text-2xl font-bold text-gray-900">-</div>
          </div>
        </div>

        {/* Filters */}
        <div className="bg-white rounded-lg shadow p-4 mb-6">
          <div className="flex flex-wrap gap-2">
            <button
              onClick={() => { setFilterStatus('All'); setCurrentPage(1); }}
              className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                filterStatus === 'All'
                  ? 'bg-blue-600 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              Tất cả
            </button>
            <button
              onClick={() => { setFilterStatus('Pending'); setCurrentPage(1); }}
              className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                filterStatus === 'Pending'
                  ? 'bg-yellow-500 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              ⏳ Chờ duyệt
            </button>
            <button
              onClick={() => { setFilterStatus('Approved'); setCurrentPage(1); }}
              className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                filterStatus === 'Approved'
                  ? 'bg-green-600 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              ✅ Đã duyệt
            </button>
            <button
              onClick={() => { setFilterStatus('Rejected'); setCurrentPage(1); }}
              className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                filterStatus === 'Rejected'
                  ? 'bg-red-600 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              ❌ Từ chối
            </button>
          </div>

          {/* Search and Advanced Filters */}
          <div className="mt-4 space-y-4">
            {/* Search Bar */}
            <div className="flex gap-2">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                placeholder="Tìm kiếm theo tiêu đề, địa chỉ, ID..."
                className="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
              <button
                onClick={handleSearch}
                className="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
              >
                🔍 Tìm kiếm
              </button>
              <button
                onClick={() => setShowAdvancedFilters(!showAdvancedFilters)}
                className="px-4 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700 transition-colors"
              >
                {showAdvancedFilters ? '▲ Ẩn bộ lọc' : '▼ Bộ lọc nâng cao'}
              </button>
            </div>

            {/* Advanced Filters Panel */}
            {showAdvancedFilters && (
              <div className="p-4 bg-gray-50 rounded-lg border border-gray-200">
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  {/* Price Range */}
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      💰 Khoảng giá (VNĐ)
                    </label>
                    <div className="flex gap-2">
                      <input
                        type="number"
                        value={priceMin}
                        onChange={(e) => setPriceMin(e.target.value)}
                        placeholder="Từ"
                        className="w-1/2 px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                      <input
                        type="number"
                        value={priceMax}
                        onChange={(e) => setPriceMax(e.target.value)}
                        placeholder="Đến"
                        className="w-1/2 px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                    </div>
                  </div>

                  {/* Area Range */}
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      📐 Diện tích (m²)
                    </label>
                    <div className="flex gap-2">
                      <input
                        type="number"
                        value={areaMin}
                        onChange={(e) => setAreaMin(e.target.value)}
                        placeholder="Từ"
                        className="w-1/2 px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                      <input
                        type="number"
                        value={areaMax}
                        onChange={(e) => setAreaMax(e.target.value)}
                        placeholder="Đến"
                        className="w-1/2 px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                    </div>
                  </div>

                  {/* House Status */}
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      🏠 Trạng thái nhà
                    </label>
                    <select
                      value={filterHouseStatus}
                      onChange={(e) => setFilterHouseStatus(e.target.value)}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    >
                      <option value="All">Tất cả</option>
                      <option value="Available">Còn trống</option>
                      <option value="Sold">Đã bán</option>
                      <option value="Rented">Đã cho thuê</option>
                    </select>
                  </div>
                </div>

                {/* Filter Actions */}
                <div className="flex gap-2 mt-4">
                  <button
                    onClick={handleSearch}
                    className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
                  >
                    Áp dụng bộ lọc
                  </button>
                  <button
                    onClick={handleClearFilters}
                    className="px-4 py-2 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors"
                  >
                    Xóa bộ lọc
                  </button>
                </div>
              </div>
            )}
          </div>
        </div>

        {/* Houses Table */}
        <div className="bg-white rounded-lg shadow overflow-hidden">
          {loading ? (
            <div className="p-8 text-center">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
              <p className="mt-4 text-gray-600">Đang tải...</p>
            </div>
          ) : houses.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
              Không có nhà nào trong danh sách này
            </div>
          ) : (
            <>
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        ID
                      </th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Tiêu đề
                      </th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Địa chỉ
                      </th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Giá
                      </th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Trạng thái
                      </th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Ngày tạo
                      </th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Hành động
                      </th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {houses.map((house) => (
                      <tr key={house.HouseID} className="hover:bg-gray-50">
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                          #{house.HouseID}
                        </td>
                        <td className="px-6 py-4 text-sm text-gray-900">
                          <div className="font-medium">{house.Title}</div>
                          <div className="text-gray-500 text-xs">
                            {house.Bedrooms}PN • {house.Bathrooms}WC • {house.Area}m²
                          </div>
                        </td>
                        <td className="px-6 py-4 text-sm text-gray-500">
                          {house.Address?.substring(0, 50)}...
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                          {formatPrice(house.Price)}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          {getStatusBadge(house.ApprovalStatus)}
                          {house.RejectionReason && (
                            <div className="text-xs text-red-600 mt-1">
                              Lý do: {house.RejectionReason}
                            </div>
                          )}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                          {formatDate(house.CreatedAt)}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm">
                          <div className="flex gap-2">
                            <button
                              onClick={() => handleViewDetail(house.HouseID)}
                              className="px-3 py-1 bg-blue-600 text-white rounded hover:bg-blue-700 transition-colors"
                              title="Xem chi tiết"
                            >
                              👁️ Xem
                            </button>
                            {house.ApprovalStatus === 'Pending' && (
                              <>
                                <button
                                  onClick={() => handleApprove(house.HouseID)}
                                  className="px-3 py-1 bg-green-600 text-white rounded hover:bg-green-700 transition-colors"
                                  title="Duyệt"
                                >
                                  ✓ Duyệt
                                </button>
                                <button
                                  onClick={() => handleRejectClick(house)}
                                  className="px-3 py-1 bg-red-600 text-white rounded hover:bg-red-700 transition-colors"
                                  title="Từ chối"
                                >
                                  ✗ Từ chối
                                </button>
                              </>
                            )}
                            {house.ApprovalStatus === 'Rejected' && (
                              <button
                                onClick={() => handleApprove(house.HouseID)}
                                className="px-3 py-1 bg-green-600 text-white rounded hover:bg-green-700 transition-colors"
                                title="Duyệt lại"
                              >
                                ✓ Duyệt lại
                              </button>
                            )}
                            <button
                              onClick={() => handleDelete(house.HouseID)}
                              className="px-3 py-1 bg-gray-600 text-white rounded hover:bg-gray-700 transition-colors"
                              title="Xóa"
                            >
                              🗑️ Xóa
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>

              {/* Pagination */}
              <div className="bg-gray-50 px-6 py-4 flex items-center justify-between border-t border-gray-200">
                <div className="text-sm text-gray-700">
                  Hiển thị {houses.length} / {totalHouses} nhà
                </div>
                <div className="flex gap-2">
                  <button
                    onClick={() => setCurrentPage(prev => Math.max(1, prev - 1))}
                    disabled={currentPage === 1}
                    className="px-4 py-2 border border-gray-300 rounded-lg bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    ← Trước
                  </button>
                  <span className="px-4 py-2 text-sm text-gray-700">
                    Trang {currentPage} / {totalPages}
                  </span>
                  <button
                    onClick={() => setCurrentPage(prev => Math.min(totalPages, prev + 1))}
                    disabled={currentPage === totalPages}
                    className="px-4 py-2 border border-gray-300 rounded-lg bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    Sau →
                  </button>
                </div>
              </div>
            </>
          )}
        </div>

        {/* Reject Modal */}
        {showRejectModal && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div className="bg-white rounded-lg shadow-xl p-6 max-w-md w-full mx-4">
              <h3 className="text-xl font-bold text-gray-900 mb-4">
                Từ chối nhà #{selectedHouse?.HouseID}
              </h3>
              <p className="text-sm text-gray-600 mb-4">
                <strong>Tiêu đề:</strong> {selectedHouse?.Title}
              </p>
              <div className="mb-4">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Lý do từ chối <span className="text-red-500">*</span>
                </label>
                <textarea
                  value={rejectReason}
                  onChange={(e) => setRejectReason(e.target.value)}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-red-500"
                  rows="4"
                  placeholder="Nhập lý do từ chối (ví dụ: Thông tin không đầy đủ, hình ảnh không rõ ràng...)"
                />
              </div>
              <div className="flex gap-3 justify-end">
                <button
                  onClick={() => setShowRejectModal(false)}
                  className="px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50"
                >
                  Hủy
                </button>
                <button
                  onClick={handleRejectSubmit}
                  className="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700"
                >
                  Xác nhận từ chối
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Detail/Edit Modal */}
        {showDetailModal && houseDetail && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 overflow-y-auto">
            <div className="bg-white rounded-lg shadow-xl p-6 max-w-4xl w-full mx-4 my-8">
              <div className="flex justify-between items-center mb-4">
                <h3 className="text-2xl font-bold text-gray-900">
                  Chi tiết nhà #{houseDetail.house.HouseID}
                </h3>
                <button
                  onClick={() => setShowDetailModal(false)}
                  className="text-gray-500 hover:text-gray-700"
                >
                  ✕
                </button>
              </div>

              {!isEditMode ? (
                // View Mode
                <div className="space-y-4">
                  {/* Status & Actions */}
                  <div className="pb-4 border-b">
                    <div className="flex gap-4 items-center mb-3">
                      {getStatusBadge(houseDetail.house.ApprovalStatus)}
                      <span className="px-3 py-1 bg-gray-100 text-gray-800 rounded-full text-sm font-medium">
                        {houseDetail.house.Status}
                      </span>
                      <button
                        onClick={() => setIsEditMode(true)}
                        className="ml-auto px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
                      >
                        ✏️ Chỉnh sửa
                      </button>
                    </div>
                    
                    {/* Quick Status Change */}
                    <div className="flex gap-2 items-center">
                      <span className="text-sm text-gray-600 font-medium">Đổi trạng thái nhanh:</span>
                      <button
                        onClick={() => handleQuickStatusChange(houseDetail.house.HouseID, 'Available')}
                        className={`px-3 py-1.5 rounded text-sm font-medium transition-colors ${
                          houseDetail.house.Status === 'Available'
                            ? 'bg-green-600 text-white'
                            : 'bg-green-100 text-green-700 hover:bg-green-200'
                        }`}
                        disabled={houseDetail.house.Status === 'Available'}
                      >
                        ✓ Available
                      </button>
                      <button
                        onClick={() => handleQuickStatusChange(houseDetail.house.HouseID, 'Sold')}
                        className={`px-3 py-1.5 rounded text-sm font-medium transition-colors ${
                          houseDetail.house.Status === 'Sold'
                            ? 'bg-red-600 text-white'
                            : 'bg-red-100 text-red-700 hover:bg-red-200'
                        }`}
                        disabled={houseDetail.house.Status === 'Sold'}
                      >
                        🏷️ Sold
                      </button>
                      <button
                        onClick={() => handleQuickStatusChange(houseDetail.house.HouseID, 'Rented')}
                        className={`px-3 py-1.5 rounded text-sm font-medium transition-colors ${
                          houseDetail.house.Status === 'Rented'
                            ? 'bg-blue-600 text-white'
                            : 'bg-blue-100 text-blue-700 hover:bg-blue-200'
                        }`}
                        disabled={houseDetail.house.Status === 'Rented'}
                      >
                        🏠 Rented
                      </button>
                    </div>
                  </div>

                  {/* Basic Info */}
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <label className="text-sm font-medium text-gray-500">Tiêu đề</label>
                      <p className="text-gray-900">{houseDetail.house.Title}</p>
                    </div>
                    <div>
                      <label className="text-sm font-medium text-gray-500">Loại nhà</label>
                      <p className="text-gray-900">{houseDetail.house.HouseType || 'N/A'}</p>
                    </div>
                    <div>
                      <label className="text-sm font-medium text-gray-500">Giá</label>
                      <p className="text-gray-900 font-semibold">{formatPrice(houseDetail.house.Price)}</p>
                    </div>
                    <div>
                      <label className="text-sm font-medium text-gray-500">Diện tích</label>
                      <p className="text-gray-900">{houseDetail.house.Area} m²</p>
                    </div>
                    <div>
                      <label className="text-sm font-medium text-gray-500">Phòng ngủ</label>
                      <p className="text-gray-900">{houseDetail.house.Bedrooms} phòng</p>
                    </div>
                    <div>
                      <label className="text-sm font-medium text-gray-500">Phòng tắm</label>
                      <p className="text-gray-900">{houseDetail.house.Bathrooms} phòng</p>
                    </div>
                    <div>
                      <label className="text-sm font-medium text-gray-500">Hướng nhà</label>
                      <p className="text-gray-900">{houseDetail.house.Orientation || 'N/A'}</p>
                    </div>
                    <div>
                      <label className="text-sm font-medium text-gray-500">Ngày tạo</label>
                      <p className="text-gray-900">{formatDate(houseDetail.house.CreatedAt)}</p>
                    </div>
                  </div>

                  {/* Address */}
                  <div>
                    <label className="text-sm font-medium text-gray-500">Địa chỉ</label>
                    <p className="text-gray-900">{houseDetail.house.Address}</p>
                  </div>

                  {/* Description */}
                  <div>
                    <label className="text-sm font-medium text-gray-500">Mô tả</label>
                    <p className="text-gray-900 whitespace-pre-wrap">{houseDetail.house.Description}</p>
                  </div>

                  {/* Owner Info */}
                  <div className="bg-gray-50 p-4 rounded-lg">
                    <h4 className="font-semibold text-gray-900 mb-2">Thông tin chủ nhà</h4>
                    <div className="grid grid-cols-2 gap-2">
                      <div>
                        <span className="text-sm text-gray-500">Tên:</span>
                        <span className="ml-2 text-gray-900">{houseDetail.house.OwnerName}</span>
                      </div>
                      <div>
                        <span className="text-sm text-gray-500">Email:</span>
                        <span className="ml-2 text-gray-900">{houseDetail.house.OwnerEmail}</span>
                      </div>
                      <div>
                        <span className="text-sm text-gray-500">SĐT:</span>
                        <span className="ml-2 text-gray-900">{houseDetail.house.OwnerPhone || 'N/A'}</span>
                      </div>
                    </div>
                  </div>

                  {/* Approval Info */}
                  {houseDetail.house.ApprovalStatus !== 'Pending' && (
                    <div className="bg-blue-50 p-4 rounded-lg">
                      <h4 className="font-semibold text-gray-900 mb-2">Thông tin duyệt</h4>
                      {houseDetail.house.ApprovalStatus === 'Approved' && (
                        <div className="space-y-1">
                          <p className="text-sm text-gray-600">
                            Được duyệt bởi: <span className="font-medium">{houseDetail.house.ApproverName || 'N/A'}</span>
                          </p>
                          <p className="text-sm text-gray-600">
                            Thời gian: {formatDate(houseDetail.house.ApprovedAt)}
                          </p>
                        </div>
                      )}
                      {houseDetail.house.ApprovalStatus === 'Rejected' && (
                        <p className="text-sm text-red-600">
                          Lý do từ chối: {houseDetail.house.RejectionReason}
                        </p>
                      )}
                    </div>
                  )}

                  {/* Images */}
                  {houseDetail.images && houseDetail.images.length > 0 && (
                    <div>
                      <h4 className="font-semibold text-gray-900 mb-3">Hình ảnh ({houseDetail.images.length})</h4>
                      <div className="grid grid-cols-3 gap-4">
                        {houseDetail.images.map((img) => (
                          <div key={img.ImageID} className="relative group border rounded-lg overflow-hidden">
                            <img
                              src={img.CloudPath || '/placeholder.jpg'}
                              alt={img.FileName}
                              className="w-full h-40 object-cover"
                            />
                            {img.IsCover && (
                              <span className="absolute top-2 left-2 bg-blue-600 text-white text-xs px-2 py-1 rounded">
                                ⭐ Ảnh bìa
                              </span>
                            )}
                            {/* Action buttons - show on hover */}
                            <div className="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-50 transition-all flex items-center justify-center gap-2 opacity-0 group-hover:opacity-100">
                              {!img.IsCover && (
                                <button
                                  onClick={() => handleSetCoverImage(img.ImageID)}
                                  className="px-3 py-1.5 bg-blue-600 text-white text-sm rounded hover:bg-blue-700"
                                  title="Đặt làm ảnh bìa"
                                >
                                  ⭐ Đặt bìa
                                </button>
                              )}
                              <button
                                onClick={() => handleDeleteImage(img.ImageID)}
                                className="px-3 py-1.5 bg-red-600 text-white text-sm rounded hover:bg-red-700"
                                title="Xóa ảnh"
                              >
                                🗑️ Xóa
                              </button>
                            </div>
                          </div>
                        ))}
                      </div>
                      <div className="mt-3 text-sm text-gray-500">
                        💡 Hover vào ảnh để hiện nút thao tác
                      </div>
                    </div>
                  )}
                  
                  {houseDetail.images && houseDetail.images.length === 0 && (
                    <div className="text-center py-8 bg-gray-50 rounded-lg">
                      <p className="text-gray-500">Chưa có hình ảnh nào</p>
                    </div>
                  )}
                </div>
              ) : (
                // Edit Mode
                <div className="space-y-4">
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Tiêu đề *</label>
                      <input
                        type="text"
                        value={editForm.Title || ''}
                        onChange={(e) => setEditForm({...editForm, Title: e.target.value})}
                        className="w-full border border-gray-300 rounded-lg px-3 py-2"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Loại nhà</label>
                      <input
                        type="text"
                        value={editForm.HouseType || ''}
                        onChange={(e) => setEditForm({...editForm, HouseType: e.target.value})}
                        className="w-full border border-gray-300 rounded-lg px-3 py-2"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Giá *</label>
                      <input
                        type="number"
                        value={editForm.Price || ''}
                        onChange={(e) => setEditForm({...editForm, Price: e.target.value})}
                        className="w-full border border-gray-300 rounded-lg px-3 py-2"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Diện tích (m²) *</label>
                      <input
                        type="number"
                        value={editForm.Area || ''}
                        onChange={(e) => setEditForm({...editForm, Area: e.target.value})}
                        className="w-full border border-gray-300 rounded-lg px-3 py-2"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Phòng ngủ</label>
                      <input
                        type="number"
                        value={editForm.Bedrooms || ''}
                        onChange={(e) => setEditForm({...editForm, Bedrooms: e.target.value})}
                        className="w-full border border-gray-300 rounded-lg px-3 py-2"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Phòng tắm</label>
                      <input
                        type="number"
                        value={editForm.Bathrooms || ''}
                        onChange={(e) => setEditForm({...editForm, Bathrooms: e.target.value})}
                        className="w-full border border-gray-300 rounded-lg px-3 py-2"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Hướng nhà</label>
                      <select
                        value={editForm.Orientation || ''}
                        onChange={(e) => setEditForm({...editForm, Orientation: e.target.value})}
                        className="w-full border border-gray-300 rounded-lg px-3 py-2"
                      >
                        <option value="">Chọn hướng</option>
                        <option value="Đông">Đông</option>
                        <option value="Tây">Tây</option>
                        <option value="Nam">Nam</option>
                        <option value="Bắc">Bắc</option>
                        <option value="Đông Nam">Đông Nam</option>
                        <option value="Đông Bắc">Đông Bắc</option>
                        <option value="Tây Nam">Tây Nam</option>
                        <option value="Tây Bắc">Tây Bắc</option>
                      </select>
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Trạng thái</label>
                      <select
                        value={editForm.Status || ''}
                        onChange={(e) => setEditForm({...editForm, Status: e.target.value})}
                        className="w-full border border-gray-300 rounded-lg px-3 py-2"
                      >
                        <option value="Available">Available</option>
                        <option value="Sold">Sold</option>
                        <option value="Rented">Rented</option>
                      </select>
                    </div>
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Địa chỉ *</label>
                    <input
                      type="text"
                      value={editForm.Address || ''}
                      onChange={(e) => setEditForm({...editForm, Address: e.target.value})}
                      className="w-full border border-gray-300 rounded-lg px-3 py-2"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Mô tả</label>
                    <textarea
                      value={editForm.Description || ''}
                      onChange={(e) => setEditForm({...editForm, Description: e.target.value})}
                      className="w-full border border-gray-300 rounded-lg px-3 py-2"
                      rows="6"
                    />
                  </div>

                  <div className="flex gap-3 justify-end pt-4 border-t">
                    <button
                      onClick={() => {
                        setIsEditMode(false);
                        setEditForm(houseDetail.house);
                      }}
                      className="px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50"
                    >
                      Hủy
                    </button>
                    <button
                      onClick={handleEditSubmit}
                      className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
                    >
                      💾 Lưu thay đổi
                    </button>
                  </div>
                </div>
              )}
            </div>
          </div>
        )}
      </div>
    </AdminLayout>
  );
}
