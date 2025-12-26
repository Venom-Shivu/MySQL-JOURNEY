USE venomsql;

-- =============================================
-- 05. SETUP ADDRESSES (One-to-Many)
-- =============================================

DROP TABLE IF EXISTS addresses;

CREATE TABLE addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    Street VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Pincode VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO addresses (user_id, Street, City, State, Pincode) VALUES
(22, '14 Park Street', 'Kolkata', 'West Bengal', '700016'), -- Your original entry
(2, 'A-102, Silicon Valley', 'Pune', 'Maharashtra', '411045'),
(5, 'Plot 7, Gachibowli', 'Hyderabad', 'Telangana', '500032'),
(11, '45/B, Anna Nagar', 'Chennai', 'Tamil Nadu', '600040'),
(23, 'House 3, C Scheme', 'Jaipur', 'Rajasthan', '302001'),
(1, '8, Residency Road', 'Bengaluru', 'Karnataka', '560025'),
(3, '110, Sector 44', 'Gurugram', 'Haryana', '122003'),
(4, '56, Andheri East', 'Mumbai', 'Maharashtra', '400093'),
(6, '90/1, Karol Bagh', 'New Delhi', 'Delhi', '110005'),
(7, 'Flat 12, Palam Vihar', 'Faridabad', 'Haryana', '121006'),
(8, '78, Vile Parle West', 'Mumbai', 'Maharashtra', '400056'),
(9, '20, Sarjapur Road', 'Bengaluru', 'Karnataka', '560102'),
(10, 'B-3, Civil Lines', 'Allahabad', 'Uttar Pradesh', '211001'),
(12, '15, Moti Mahal', 'Lucknow', 'Uttar Pradesh', '226001'),
(13, '21, Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001'),
(14, 'Block D, Sector 62', 'Noida', 'Uttar Pradesh', '201309'),
(15, '10, Salt Lake Sector 5', 'Kolkata', 'West Bengal', '700091'),
(16, '45, Jubilee Hills Rd', 'Hyderabad', 'Telangana', '500033'),
(17, '8/1, Koregaon Park', 'Pune', 'Maharashtra', '411001'),
(18, 'G-5, Malviya Nagar', 'Jaipur', 'Rajasthan', '302017'),
(19, '30, Bapunagar', 'Ahmedabad', 'Gujarat', '380024'),
(20, '12-A, Connaught Place', 'New Delhi', 'Delhi', '110001'),
(21, '40, T Nagar', 'Chennai', 'Tamil Nadu', '600017'),
(24, '2, Gomti Nagar Ext.', 'Lucknow', 'Uttar Pradesh', '226010'),
(25, 'Plot 33, Electronic City', 'Bengaluru', 'Karnataka', '560100'),
(26, '1/1, Worli', 'Mumbai', 'Maharashtra', '400018'),
(27, '67, Rajpur Road', 'Dehradun', 'Uttarakhand', '248001'),
(28, 'Block E, South City', 'Gurugram', 'Haryana', '122001'),
(29, '99, Sector 17', 'Chandigarh', 'Punjab', '160017');