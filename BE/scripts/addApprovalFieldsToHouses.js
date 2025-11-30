const mysql = require('mysql2/promise');
const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '../../config.env') });

async function addApprovalFields() {
    let connection;
    
    try {
        console.log('🔧 Connecting to MySQL...');
        
        connection = await mysql.createConnection({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || '',
            database: process.env.DB_NAME || 'smarthome',
            port: process.env.DB_PORT || 3306
        });

        console.log('✅ Connected to database!');

        // Check if ApprovalStatus column already exists
        const [columns] = await connection.execute(
            "SHOW COLUMNS FROM houses LIKE 'ApprovalStatus'"
        );

        if (columns.length > 0) {
            console.log('⚠️  ApprovalStatus already exists. Skipping migration.');
            return;
        }

        console.log('📝 Adding approval fields to houses table...');

        // Add ApprovalStatus
        await connection.execute(`
            ALTER TABLE houses 
            ADD COLUMN ApprovalStatus ENUM('Pending','Approved','Rejected') DEFAULT 'Pending' 
            COMMENT 'Trạng thái duyệt bài' 
            AFTER Status
        `);
        console.log('✅ Added ApprovalStatus');

        // Add RejectionReason
        await connection.execute(`
            ALTER TABLE houses 
            ADD COLUMN RejectionReason TEXT NULL 
            COMMENT 'Lý do từ chối' 
            AFTER ApprovalStatus
        `);
        console.log('✅ Added RejectionReason');

        // Add ApprovedBy
        await connection.execute(`
            ALTER TABLE houses 
            ADD COLUMN ApprovedBy BIGINT UNSIGNED NULL 
            COMMENT 'Admin đã duyệt (UserID)' 
            AFTER RejectionReason,
            ADD FOREIGN KEY (ApprovedBy) REFERENCES users(UserID) ON DELETE SET NULL
        `);
        console.log('✅ Added ApprovedBy with foreign key');

        // Add ApprovedAt
        await connection.execute(`
            ALTER TABLE houses 
            ADD COLUMN ApprovedAt DATETIME NULL 
            COMMENT 'Thời gian duyệt' 
            AFTER ApprovedBy
        `);
        console.log('✅ Added ApprovedAt');

        // Add index for ApprovalStatus
        await connection.execute(`
            ALTER TABLE houses 
            ADD INDEX idx_approval_status (ApprovalStatus)
        `);
        console.log('✅ Added index on ApprovalStatus');

        // Update existing houses to Approved (for backward compatibility)
        await connection.execute(`
            UPDATE houses 
            SET ApprovalStatus = 'Approved', ApprovedAt = createdAt 
            WHERE ApprovalStatus IS NULL OR ApprovalStatus = 'Pending'
        `);
        console.log('✅ Updated existing houses to Approved');

        console.log('');
        console.log('🎉 Migration completed successfully!');
        console.log('');
        console.log('📊 New fields added:');
        console.log('   - ApprovalStatus (Pending/Approved/Rejected)');
        console.log('   - RejectionReason (TEXT)');
        console.log('   - ApprovedBy (BIGINT → users.UserID)');
        console.log('   - ApprovedAt (DATETIME)');

    } catch (error) {
        console.error('❌ Migration failed:', error.message);
        throw error;
    } finally {
        if (connection) {
            await connection.end();
            console.log('🔌 Database connection closed');
        }
    }
}

// Run migration
if (require.main === module) {
    addApprovalFields()
        .then(() => {
            console.log('✅ Script completed successfully');
            process.exit(0);
        })
        .catch((error) => {
            console.error('❌ Script failed:', error.message);
            process.exit(1);
        });
}

module.exports = addApprovalFields;
