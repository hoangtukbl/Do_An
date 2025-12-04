import { useState, useEffect } from 'react';
import axios from 'axios';
import AdminLayout from '../../components/AdminLayout';

export default function AdminAppointments() {
  const [appointments, setAppointments] = useState([]);
  const [stats, setStats] = useState({ total: 0, pending: 0, confirmed: 0, cancelled: 0, completed: 0 });
  const [loading, setLoading] = useState(true);
  
  // Filters
  const [filterStatus, setFilterStatus] = useState('All');
  const [dateFrom, setDateFrom] = useState('');
  const [dateTo, setDateTo] = useState('');
  
  // Pagination
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalAppointments, setTotalAppointments] = useState(0);
  const pageSize = 10;
  
  // Modals
  const [showDetailModal, setShowDetailModal] = useState(false);
  const [selectedAppointment, setSelectedAppointment] = useState(null);

  useEffect(() => {
    fetchAppointments();
    fetchStats();
  }, [filterStatus, dateFrom, dateTo, currentPage]);

  const fetchAppointments = async () => {
    setLoading(true);
    try {
      const token = localStorage.getItem('token');
      let url = `http://localhost:3001/api/admin/appointments?page=${currentPage}&pageSize=${pageSize}`;
      
      if (filterStatus !== 'All') {
        url += `&status=${filterStatus}`;
      }
      
      if (dateFrom) {
        url += `&dateFrom=${dateFrom}`;
      }
      
      if (dateTo) {
        url += `&dateTo=${dateTo}`;
      }
      
      const response = await axios.get(url, {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      
      setAppointments(response.data.data || []);
      setTotalPages(response.data.totalPages || 1);
      setTotalAppointments(response.data.total || 0);
    } catch (error) {
      console.error('Error fetching appointments:', error);
      alert('Lỗi khi tải danh sách lịch hẹn');
    } finally {
      setLoading(false);
    }
  };

  const fetchStats = async () => {
    try {
      const token = localStorage.getItem('token');
      const response = await axios.get('http://localhost:3001/api/admin/appointments/stats', {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      
      setStats(response.data.data || { total: 0, pending: 0, confirmed: 0, cancelled: 0, completed: 0 });
    } catch (error) {
      console.error('Error fetching stats:', error);
    }
  };

  const handleViewDetail = async (appointmentId) => {
    try {
      const token = localStorage.getItem('token');
      const response = await axios.get(`http://localhost:3001/api/admin/appointments/${appointmentId}`, {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      
      setSelectedAppointment(response.data.data);
      setShowDetailModal(true);
    } catch (error) {
      console.error('Error fetching appointment detail:', error);
      alert('Lỗi khi tải chi tiết lịch hẹn');
    }
  };

  const handleChangeStatus = async (appointmentId, newStatus) => {
    if (!confirm(`Bạn có chắc muốn đổi trạng thái thành "${newStatus}"?`)) {
      return;
    }

    try {
      const token = localStorage.getItem('token');
      await axios.put(
        `http://localhost:3001/api/admin/appointments/${appointmentId}/status`,
        { status: newStatus },
        { headers: { 'Authorization': `Bearer ${token}` } }
      );
      
      alert('Đã cập nhật trạng thái thành công!');
      fetchAppointments();
      fetchStats();
      
      if (showDetailModal && selectedAppointment?.AppointmentID === appointmentId) {
        setSelectedAppointment({ ...selectedAppointment, Status: newStatus });
      }
    } catch (error) {
      console.error('Error changing status:', error);
      alert('Lỗi khi cập nhật trạng thái');
    }
  };

  const handleDelete = async (appointmentId) => {
    if (!confirm('Bạn có chắc muốn xóa lịch hẹn này?')) {
      return;
    }

    try {
      const token = localStorage.getItem('token');
      await axios.delete(`http://localhost:3001/api/admin/appointments/${appointmentId}`, {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      
      alert('Đã xóa lịch hẹn thành công!');
      setShowDetailModal(false);
      fetchAppointments();
      fetchStats();
    } catch (error) {
      console.error('Error deleting appointment:', error);
      alert('Lỗi khi xóa lịch hẹn');
    }
  };

  const handleClearFilters = () => {
    setFilterStatus('All');
    setDateFrom('');
    setDateTo('');
    setCurrentPage(1);
  };

  const getStatusColor = (status) => {
    const colors = {
      'Pending': 'bg-yellow-100 text-yellow-800',
      'Confirmed': 'bg-green-100 text-green-800',
      'Cancelled': 'bg-red-100 text-red-800',
      'Completed': 'bg-blue-100 text-blue-800'
    };
    return colors[status] || 'bg-gray-100 text-gray-800';
  };

  const formatDate = (dateString) => {
    if (!dateString) return 'N/A';
    return new Date(dateString).toLocaleString('vi-VN');
  };

  const parseDates = (datesString) => {
    if (!datesString) return [];
    try {
      return JSON.parse(datesString);
    } catch (e) {
      return [];
    }
  };

  return (
    <AdminLayout>
      <div className="space-y-6">
        {/* Header */}
        <div className="flex justify-between items-center">
          <h1 className="text-3xl font-bold text-gray-900">Quản lý Lịch hẹn</h1>
          <div className="text-sm text-gray-500">
            Tổng số: {totalAppointments} lịch hẹn
          </div>
        </div>

        {/* Statistics Cards */}
        <div className="grid grid-cols-1 md:grid-cols-5 gap-4">
          <div className="bg-white rounded-lg shadow p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm text-gray-600">Tổng số</p>
                <p className="text-2xl font-bold text-gray-900">{stats.total}</p>
              </div>
              <div className="text-3xl">📅</div>
            </div>
          </div>
          
          <div className="bg-yellow-50 rounded-lg shadow p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm text-yellow-600">Chờ xác nhận</p>
                <p className="text-2xl font-bold text-yellow-900">{stats.pending}</p>
              </div>
              <div className="text-3xl">⏳</div>
            </div>
          </div>
          
          <div className="bg-green-50 rounded-lg shadow p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm text-green-600">Đã xác nhận</p>
                <p className="text-2xl font-bold text-green-900">{stats.confirmed}</p>
              </div>
              <div className="text-3xl">✅</div>
            </div>
          </div>
          
          <div className="bg-red-50 rounded-lg shadow p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm text-red-600">Đã hủy</p>
                <p className="text-2xl font-bold text-red-900">{stats.cancelled}</p>
              </div>
              <div className="text-3xl">❌</div>
            </div>
          </div>
          
          <div className="bg-blue-50 rounded-lg shadow p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm text-blue-600">Hoàn thành</p>
                <p className="text-2xl font-bold text-blue-900">{stats.completed}</p>
              </div>
              <div className="text-3xl">🎉</div>
            </div>
          </div>
        </div>

        {/* Filters */}
        <div className="bg-white rounded-lg shadow p-6">
          <h2 className="text-lg font-semibold mb-4">Bộ lọc</h2>
          
          <div className="flex flex-wrap gap-2 mb-4">
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
              ⏳ Chờ xác nhận
            </button>
            <button
              onClick={() => { setFilterStatus('Confirmed'); setCurrentPage(1); }}
              className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                filterStatus === 'Confirmed'
                  ? 'bg-green-600 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              ✅ Đã xác nhận
            </button>
            <button
              onClick={() => { setFilterStatus('Cancelled'); setCurrentPage(1); }}
              className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                filterStatus === 'Cancelled'
                  ? 'bg-red-600 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              ❌ Đã hủy
            </button>
            <button
              onClick={() => { setFilterStatus('Completed'); setCurrentPage(1); }}
              className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                filterStatus === 'Completed'
                  ? 'bg-blue-600 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              🎉 Hoàn thành
            </button>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                📅 Từ ngày
              </label>
              <input
                type="date"
                value={dateFrom}
                onChange={(e) => setDateFrom(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                📅 Đến ngày
              </label>
              <input
                type="date"
                value={dateTo}
                onChange={(e) => setDateTo(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            
            <div className="flex items-end">
              <button
                onClick={handleClearFilters}
                className="w-full px-4 py-2 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors"
              >
                Xóa bộ lọc
              </button>
            </div>
          </div>
        </div>

        {/* Appointments Table */}
        <div className="bg-white rounded-lg shadow overflow-hidden">
          {loading ? (
            <div className="p-8 text-center">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
              <p className="mt-4 text-gray-600">Đang tải...</p>
            </div>
          ) : appointments.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
              Không có lịch hẹn nào
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
                        Người mua
                      </th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Người bán
                      </th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Trạng thái
                      </th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Ngày tạo
                      </th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Thao tác
                      </th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {appointments.map((appointment) => (
                      <tr key={appointment.AppointmentID} className="hover:bg-gray-50">
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                          #{appointment.AppointmentID}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <div className="text-sm font-medium text-gray-900">
                            {appointment.BuyerName || 'N/A'}
                          </div>
                          <div className="text-sm text-gray-500">
                            {appointment.BuyerEmail}
                          </div>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <div className="text-sm font-medium text-gray-900">
                            {appointment.SellerName || 'Chưa có'}
                          </div>
                          <div className="text-sm text-gray-500">
                            {appointment.SellerEmail || '-'}
                          </div>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <span className={`px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full ${getStatusColor(appointment.Status)}`}>
                            {appointment.Status}
                          </span>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                          {formatDate(appointment.CreatedAt)}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm font-medium space-x-2">
                          <button
                            onClick={() => handleViewDetail(appointment.AppointmentID)}
                            className="text-blue-600 hover:text-blue-900"
                          >
                            Xem
                          </button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>

              {/* Pagination */}
              <div className="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6">
                <div className="flex-1 flex justify-between sm:hidden">
                  <button
                    onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}
                    disabled={currentPage === 1}
                    className="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50"
                  >
                    Trước
                  </button>
                  <button
                    onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}
                    disabled={currentPage === totalPages}
                    className="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50"
                  >
                    Sau
                  </button>
                </div>
                <div className="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
                  <div>
                    <p className="text-sm text-gray-700">
                      Hiển thị <span className="font-medium">{(currentPage - 1) * pageSize + 1}</span> đến{' '}
                      <span className="font-medium">{Math.min(currentPage * pageSize, totalAppointments)}</span> trong{' '}
                      <span className="font-medium">{totalAppointments}</span> kết quả
                    </p>
                  </div>
                  <div>
                    <nav className="relative z-0 inline-flex rounded-md shadow-sm -space-x-px">
                      <button
                        onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}
                        disabled={currentPage === 1}
                        className="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50"
                      >
                        ‹
                      </button>
                      {[...Array(totalPages)].map((_, i) => (
                        <button
                          key={i + 1}
                          onClick={() => setCurrentPage(i + 1)}
                          className={`relative inline-flex items-center px-4 py-2 border text-sm font-medium ${
                            currentPage === i + 1
                              ? 'z-10 bg-blue-50 border-blue-500 text-blue-600'
                              : 'bg-white border-gray-300 text-gray-500 hover:bg-gray-50'
                          }`}
                        >
                          {i + 1}
                        </button>
                      ))}
                      <button
                        onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}
                        disabled={currentPage === totalPages}
                        className="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50"
                      >
                        ›
                      </button>
                    </nav>
                  </div>
                </div>
              </div>
            </>
          )}
        </div>
      </div>

      {/* Detail Modal */}
      {showDetailModal && selectedAppointment && (
        <div className="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
          <div className="relative top-20 mx-auto p-5 border w-11/12 md:w-3/4 lg:w-1/2 shadow-lg rounded-lg bg-white">
            <div className="flex justify-between items-center mb-4">
              <h3 className="text-2xl font-bold text-gray-900">
                Chi tiết Lịch hẹn #{selectedAppointment.AppointmentID}
              </h3>
              <button
                onClick={() => setShowDetailModal(false)}
                className="text-gray-400 hover:text-gray-600 text-2xl font-bold"
              >
                ×
              </button>
            </div>

            <div className="space-y-6">
              {/* Status */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Trạng thái</label>
                <span className={`px-3 py-1 inline-flex text-sm font-semibold rounded-full ${getStatusColor(selectedAppointment.Status)}`}>
                  {selectedAppointment.Status}
                </span>
              </div>

              {/* Buyer Info */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">👤 Người mua</label>
                <div className="bg-gray-50 p-4 rounded-lg">
                  <p className="font-semibold">{selectedAppointment.BuyerName}</p>
                  <p className="text-sm text-gray-600">Email: {selectedAppointment.BuyerEmail}</p>
                  <p className="text-sm text-gray-600">SĐT: {selectedAppointment.BuyerPhone || 'N/A'}</p>
                </div>
              </div>

              {/* Seller Info */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">🏠 Người bán</label>
                <div className="bg-gray-50 p-4 rounded-lg">
                  {selectedAppointment.SellerName ? (
                    <>
                      <p className="font-semibold">{selectedAppointment.SellerName}</p>
                      <p className="text-sm text-gray-600">Email: {selectedAppointment.SellerEmail}</p>
                      <p className="text-sm text-gray-600">SĐT: {selectedAppointment.SellerPhone || 'N/A'}</p>
                    </>
                  ) : (
                    <p className="text-gray-500">Chưa có người bán</p>
                  )}
                </div>
              </div>

              {/* Buyer Dates */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">📅 Ngày đề xuất (Người mua)</label>
                <div className="bg-blue-50 p-4 rounded-lg">
                  {parseDates(selectedAppointment.BuyerDates).length > 0 ? (
                    <ul className="list-disc list-inside space-y-1">
                      {parseDates(selectedAppointment.BuyerDates).map((date, index) => (
                        <li key={index} className="text-sm">{new Date(date).toLocaleString('vi-VN')}</li>
                      ))}
                    </ul>
                  ) : (
                    <p className="text-gray-500">Không có ngày nào</p>
                  )}
                </div>
              </div>

              {/* Seller Dates */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">📅 Ngày xác nhận (Người bán)</label>
                <div className="bg-green-50 p-4 rounded-lg">
                  {parseDates(selectedAppointment.SellerDates).length > 0 ? (
                    <ul className="list-disc list-inside space-y-1">
                      {parseDates(selectedAppointment.SellerDates).map((date, index) => (
                        <li key={index} className="text-sm">{new Date(date).toLocaleString('vi-VN')}</li>
                      ))}
                    </ul>
                  ) : (
                    <p className="text-gray-500">Chưa có ngày xác nhận</p>
                  )}
                </div>
              </div>

              {/* Timestamps */}
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Ngày tạo</label>
                  <p className="text-sm text-gray-600">{formatDate(selectedAppointment.CreatedAt)}</p>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Cập nhật lần cuối</label>
                  <p className="text-sm text-gray-600">{formatDate(selectedAppointment.UpdatedAt)}</p>
                </div>
              </div>

              {/* Actions */}
              <div className="border-t pt-4">
                <label className="block text-sm font-medium text-gray-700 mb-3">⚡ Thao tác nhanh</label>
                <div className="flex flex-wrap gap-2">
                  {selectedAppointment.Status !== 'Confirmed' && (
                    <button
                      onClick={() => handleChangeStatus(selectedAppointment.AppointmentID, 'Confirmed')}
                      className="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors"
                    >
                      ✅ Xác nhận
                    </button>
                  )}
                  {selectedAppointment.Status !== 'Cancelled' && (
                    <button
                      onClick={() => handleChangeStatus(selectedAppointment.AppointmentID, 'Cancelled')}
                      className="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors"
                    >
                      ❌ Hủy
                    </button>
                  )}
                  {selectedAppointment.Status !== 'Completed' && (
                    <button
                      onClick={() => handleChangeStatus(selectedAppointment.AppointmentID, 'Completed')}
                      className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
                    >
                      🎉 Hoàn thành
                    </button>
                  )}
                  {selectedAppointment.Status !== 'Pending' && (
                    <button
                      onClick={() => handleChangeStatus(selectedAppointment.AppointmentID, 'Pending')}
                      className="px-4 py-2 bg-yellow-600 text-white rounded-lg hover:bg-yellow-700 transition-colors"
                    >
                      ⏳ Chờ xác nhận
                    </button>
                  )}
                </div>
              </div>

              {/* Delete */}
              <div className="border-t pt-4">
                <button
                  onClick={() => handleDelete(selectedAppointment.AppointmentID)}
                  className="w-full px-4 py-2 bg-red-100 text-red-700 rounded-lg hover:bg-red-200 transition-colors font-medium"
                >
                  🗑️ Xóa lịch hẹn này
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </AdminLayout>
  );
}
