const mysql = require('mysql2/promise');

(async () => {
  try {
    const conn = await mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'smarthome'
    });
    
    console.log('📋 Checking users with Admin/Seller roles...\n');
    
    const [users] = await conn.query(`
      SELECT UserID, FullName, Email, Role 
      FROM users 
      WHERE Role IN ('Admin', 'Seller') 
      LIMIT 5
    `);
    
    console.log('Users found:', users.length);
    users.forEach(user => {
      console.log(`- UserID: ${user.UserID}, Name: ${user.FullName}, Email: ${user.Email}, Role: ${user.Role}`);
    });
    
    console.log('\n📋 Checking houses with different ApprovalStatus...\n');
    
    const [houses] = await conn.query(`
      SELECT HouseID, Title, ApprovalStatus, OwnerID, CreatedAt
      FROM houses
      ORDER BY CreatedAt DESC
      LIMIT 5
    `);
    
    console.log('Houses found:', houses.length);
    houses.forEach(house => {
      console.log(`- HouseID: ${house.HouseID}, Title: ${house.Title}, Status: ${house.ApprovalStatus}, OwnerID: ${house.OwnerID}`);
    });
    
    await conn.end();
  } catch (error) {
    console.error('Error:', error);
  }
})();
