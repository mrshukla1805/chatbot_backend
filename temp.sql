use doctor_appointments;

CREATE TABLE doctors (
    doc_id INT AUTO_INCREMENT PRIMARY KEY,
    doc_name VARCHAR(255) NOT NULL
);


CREATE TABLE slot (
    slot_id INT AUTO_INCREMENT PRIMARY KEY,
    doc_id INT,
    slot_start DATETIME NOT NULL,
    slot_end DATETIME NOT NULL,
    isSlotBooked BOOLEAN NOT NULL,
    FOREIGN KEY (doc_id) REFERENCES doctors(doc_id)
);

-- stored procedures


DELIMITER $$

CREATE PROCEDURE CreateDoctorAndSlots(IN doc_name VARCHAR(255))
	BEGIN
		-- Insert the new doctor into the doctors table
		INSERT INTO doctors (doc_name) VALUES (doc_name);
		-- Get the last inserted doctor's ID
		SET @last_doc_id = LAST_INSERT_ID();
		-- Define slot start and end times
		SET @slot_time_start = '12:00:00';
		SET @slot_time_end = '13:00:00'; -- One hour after start time
		-- Loop to insert 5 slots for the new doctor
		WHILE @slot_time_start < '17:00:00' DO
			INSERT INTO slot (doc_id, slot_start, slot_end, isSlotBooked)
			VALUES (@last_doc_id, CONCAT(CURDATE(), ' ', @slot_time_start), CONCAT(CURDATE(), ' ', @slot_time_end), FALSE);
			-- Increment the slot start and end time by 1 hour for the next iteration
			SET @slot_time_start = ADDTIME(@slot_time_start, '01:00:00');
			SET @slot_time_end = ADDTIME(@slot_time_end, '01:00:00');
		END WHILE;
	END$$

DELIMITER ;