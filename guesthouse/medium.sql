--6. Ruth Cadbury. Show the total amount payable by guest Ruth Cadbury for her room bookings. You should JOIN to the rate table using room_type_requested and occupants.

SELECT SUM(booking.nights * rate.amount)
FROM booking
JOIN rate
ON booking.occupants = rate.occupancy AND booking.room_type_requested = rate.room_type
    JOIN guest
    ON guest.id = booking.guest_id
WHERE guest.first_name = 'Ruth' AND guest.last_name = 'Cadbury' 

