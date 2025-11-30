const mysql = require('mysql2/promise');

(async () => {
  try {
    const conn = await mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'smarthome'
    });
    
    console.log('🏗️ Creating a test house with Pending status...\n');
    
    // Insert một nhà mới với ApprovalStatus = Pending
    const [result] = await conn.query(`
      INSERT INTO houses (
        Title, Description, Address, Price, Bedrooms, Bathrooms, 
        Area, Status, ApprovalStatus, OwnerID, CreatedAt
      ) VALUES (
        'Test House for Approval',
        'This is a test house to verify the approval workflow',
        '123 Test Street, Ho Chi Minh',
        5000000000,
        3,
        2,
        120.5,
        'Available',
        'Pending',
        532,
        NOW()
      )
    `);
    
    const newHouseId = result.insertId;
    console.log(`✅ Created test house with ID: ${newHouseId}`);
    console.log(`   - Title: Test House for Approval`);
    console.log(`   - ApprovalStatus: Pending`);
    console.log(`   - OwnerID: 532`);
    console.log(`\n💡 Use this HouseID (${newHouseId}) to test approve/reject endpoints`);
    
    await conn.end();
  } catch (error) {
    console.error('❌ Error:', error);
  }
})();
