import { useState, useEffect } from 'react';
import AdminLayout from '../../components/AdminLayout';
import axios from 'axios';

export default function AdminHouses() {
  const [houses, setHouses] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filterStatus, setFilterStatus] = useState('All'); // All, Pending, Approved, Rejected
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalHouses, setTotalHouses] = useState(0);
  const [showRejectModal, setShowRejectModal] = useState(false);
  const [selectedHouse, setSelectedHouse] = useState(null);
  const [rejectReason, setRejectReason] = useState('');
  const pageSize = 10;

  useEffect(() => {
    fetchHouses();
  }, [filterStatus, currentPage]);

  const fetchHouses = async () => {
    setLoading(true);
    try {
      const token = localStorage.getItem('token');
      let url = `http://localhost:3001/api/admin/houses?page=${currentPage}&pageSize=${pageSize}`;
      
      if (filterStatus !== 'All') {
        url += `&approvalStatus=${filterStatus}`;
      }
      
      const response = await axios.get(url, {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      
      setHouses(response.data.data || []);
      setTotalPages(response.data.totalPages || 1);
      setTotalHouses(response.data.total || 0);
    } catch (error) {
      console.error('Error fetching houses:', error);
      alert('Lỗi khi tải danh sách nhà');
    } finally {
      setLoading(false);
    }
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
      </div>
    </AdminLayout>
  );
}
