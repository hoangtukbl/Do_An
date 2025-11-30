const axios = require('axios');
const jwt = require('jsonwebtoken');

const BASE_URL = 'http://localhost:3001/api';
const JWT_SECRET = 'super-secret-jwt';
const TEST_HOUSE_ID = 1100;

function createAdminToken() {
  return jwt.sign({
    userId: 18,
    userid: 18,
    Role: 'Admin',
    role: 'Admin',
    Email: 'admin@smarthome.com'
  }, JWT_SECRET, { expiresIn: '24h' });
}

async function runApprovalWorkflow() {
  console.log('🧪 Testing Approval Workflow for HouseID:', TEST_HOUSE_ID);
  console.log('='.repeat(60));
  
  const token = createAdminToken();
  
  // Test 1: Check pending houses
  console.log('\n📋 Step 1: Check pending houses');
  try {
    const res = await axios.get(`${BASE_URL}/admin/houses/pending`, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
    console.log('✅ Pending houses:', res.data.data?.length || 0);
    const pendingHouse = res.data.data?.find(h => h.HouseID === TEST_HOUSE_ID);
    if (pendingHouse) {
      console.log('✅ Found test house:', {
        HouseID: pendingHouse.HouseID,
        Title: pendingHouse.Title,
        ApprovalStatus: pendingHouse.ApprovalStatus
      });
    }
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
    return;
  }
  
  // Test 2: Approve house
  console.log('\n✅ Step 2: Approve house', TEST_HOUSE_ID);
  try {
    const res = await axios.put(
      `${BASE_URL}/admin/houses/${TEST_HOUSE_ID}/approve`,
      {},
      { headers: { 'Authorization': `Bearer ${token}` } }
    );
    console.log('✅ Approved successfully!');
    console.log('   ApprovalStatus:', res.data.house?.ApprovalStatus);
    console.log('   ApprovedBy:', res.data.house?.ApprovedBy);
    console.log('   ApprovedAt:', res.data.house?.ApprovedAt);
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
    return;
  }
  
  // Test 3: Check approved houses
  console.log('\n📋 Step 3: Verify in approved list');
  try {
    const res = await axios.get(`${BASE_URL}/admin/houses?approvalStatus=Approved&page=1&pageSize=5`, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
    const approvedHouse = res.data.data?.find(h => h.HouseID === TEST_HOUSE_ID);
    if (approvedHouse) {
      console.log('✅ House is now in Approved list!');
    } else {
      console.log('⚠️  House not found in Approved list (maybe on different page)');
    }
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
  }
  
  // Test 4: Reject house (change status back to test)
  console.log('\n❌ Step 4: Test reject (change to Rejected)');
  try {
    const res = await axios.put(
      `${BASE_URL}/admin/houses/${TEST_HOUSE_ID}/reject`,
      { reason: 'Testing rejection workflow - missing documents' },
      { headers: { 'Authorization': `Bearer ${token}` } }
    );
    console.log('✅ Rejected successfully!');
    console.log('   ApprovalStatus:', res.data.house?.ApprovalStatus);
    console.log('   RejectionReason:', res.data.house?.RejectionReason);
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
  }
  
  // Test 5: Check rejected houses
  console.log('\n📋 Step 5: Verify in rejected list');
  try {
    const res = await axios.get(`${BASE_URL}/admin/houses?approvalStatus=Rejected`, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
    const rejectedHouse = res.data.data?.find(h => h.HouseID === TEST_HOUSE_ID);
    if (rejectedHouse) {
      console.log('✅ House is now in Rejected list!');
      console.log('   RejectionReason:', rejectedHouse.RejectionReason);
    }
  } catch (error) {
    console.error('❌ Error:', error.response?.data || error.message);
  }
  
  console.log('\n' + '='.repeat(60));
  console.log('✅ Approval workflow test completed!');
  console.log('\n💡 Next steps:');
  console.log('   - Implement Frontend UI for admin house management');
  console.log('   - Add notifications when house is approved/rejected');
  console.log('   - Add email notifications to sellers');
}

runApprovalWorkflow().catch(console.error);
