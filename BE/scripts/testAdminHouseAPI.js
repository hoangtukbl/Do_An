const axios = require('axios');
const jwt = require('jsonwebtoken');

const BASE_URL = 'http://localhost:3001/api';
const JWT_SECRET = 'super-secret-jwt';

// Tạo JWT token cho Admin
function createAdminToken() {
  const adminPayload = {
    userId: 18,
    userid: 18,
    Role: 'Admin',
    role: 'Admin',
    Email: 'admin@smarthome.com'
  };
  return jwt.sign(adminPayload, JWT_SECRET, { expiresIn: '24h' });
}

// Test functions
async function testGetAllHouses(token) {
  console.log('\n🧪 Test 1: GET /api/admin/houses (All houses)');
  try {
    const response = await axios.get(`${BASE_URL}/admin/houses`, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
    console.log('✅ Status:', response.status);
    console.log('✅ Total houses:', response.data.total);
    console.log('✅ Houses returned:', response.data.data?.length || 0);
    if (response.data.data && response.data.data.length > 0) {
      console.log('✅ Sample house:', {
        HouseID: response.data.data[0].HouseID,
        Title: response.data.data[0].Title,
        ApprovalStatus: response.data.data[0].ApprovalStatus
      });
    }
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
    console.error('❌ Full error:', error.code, error.errno);
  }
}

async function testGetPendingHouses(token) {
  console.log('\n🧪 Test 2: GET /api/admin/houses/pending');
  try {
    const response = await axios.get(`${BASE_URL}/admin/houses/pending`, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
    console.log('✅ Status:', response.status);
    console.log('✅ Pending houses:', response.data.total);
    console.log('✅ Houses returned:', response.data.data?.length || 0);
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
  }
}

async function testFilterByApprovalStatus(token, status) {
  console.log(`\n🧪 Test 3: GET /api/admin/houses?approvalStatus=${status}`);
  try {
    const response = await axios.get(`${BASE_URL}/admin/houses?approvalStatus=${status}`, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
    console.log('✅ Status:', response.status);
    console.log(`✅ ${status} houses:`, response.data.total);
    console.log('✅ Houses returned:', response.data.data?.length || 0);
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
  }
}

async function testApproveHouse(token, houseId) {
  console.log(`\n🧪 Test 4: PUT /api/admin/houses/${houseId}/approve`);
  try {
    const response = await axios.put(
      `${BASE_URL}/admin/houses/${houseId}/approve`,
      {},
      { headers: { 'Authorization': `Bearer ${token}` } }
    );
    console.log('✅ Status:', response.status);
    console.log('✅ Message:', response.data.message);
    console.log('✅ Updated house:', {
      HouseID: response.data.house.HouseID,
      ApprovalStatus: response.data.house.ApprovalStatus,
      ApprovedBy: response.data.house.ApprovedBy,
      ApprovedAt: response.data.house.ApprovedAt
    });
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
  }
}

async function testRejectHouse(token, houseId, reason) {
  console.log(`\n🧪 Test 5: PUT /api/admin/houses/${houseId}/reject`);
  try {
    const response = await axios.put(
      `${BASE_URL}/admin/houses/${houseId}/reject`,
      { reason },
      { headers: { 'Authorization': `Bearer ${token}` } }
    );
    console.log('✅ Status:', response.status);
    console.log('✅ Message:', response.data.message);
    console.log('✅ Updated house:', {
      HouseID: response.data.house.HouseID,
      ApprovalStatus: response.data.house.ApprovalStatus,
      RejectionReason: response.data.house.RejectionReason
    });
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
  }
}

async function testDeleteHouse(token, houseId) {
  console.log(`\n🧪 Test 6: DELETE /api/admin/houses/${houseId}`);
  try {
    const response = await axios.delete(
      `${BASE_URL}/admin/houses/${houseId}`,
      { headers: { 'Authorization': `Bearer ${token}` } }
    );
    console.log('✅ Status:', response.status);
    console.log('✅ Message:', response.data.message);
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
  }
}

// Main test runner
async function runTests() {
  console.log('🚀 Starting API Tests for Admin House Management');
  console.log('================================================\n');
  
  const adminToken = createAdminToken();
  console.log('🔑 Admin token created for UserID: 18 (admin@smarthome.com)');
  
  // Chờ để đảm bảo backend đã sẵn sàng
  await new Promise(resolve => setTimeout(resolve, 1000));
  
  // Run tests
  await testGetAllHouses(adminToken);
  await testGetPendingHouses(adminToken);
  await testFilterByApprovalStatus(adminToken, 'Approved');
  await testFilterByApprovalStatus(adminToken, 'Pending');
  
  // Note: Các test approve/reject/delete cần HouseID cụ thể
  // Uncomment và thay đổi HouseID khi cần test
  // await testApproveHouse(adminToken, 1099);
  // await testRejectHouse(adminToken, 1098, 'Thông tin không đầy đủ');
  // await testDeleteHouse(adminToken, 1095);
  
  console.log('\n================================================');
  console.log('✅ Test suite completed!');
  console.log('\n💡 Để test approve/reject/delete, uncomment các dòng trong code và thay HouseID phù hợp');
}

// Run
runTests().catch(console.error);
