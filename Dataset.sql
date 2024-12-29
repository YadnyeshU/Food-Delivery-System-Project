create database if not exists FoodDelivery;
use FoodDelivery;

-- Creating tables
create table if not exists Customers (
	CustomerId INT Primary key ,
    CustomerName varchar(255) not null,
    Customer_Email varchar(255) not null,
    Customer_phone VARCHAR(255) not null,
    Customer_address varchar(255) not null
);

create table if not exists Restaurants (
	RestaurantId varchar(6) Primary key ,
    RestaurantName varchar(200) not null,
    Restaurant_phone VARCHAR(15) not null,
    Restaurant_address varchar(255) not null,
    Cuisine varchar(200) not null,
    rating float
);

create table if not exists Menu_Items (
	ItemId varchar(6) Primary key ,
    RestaurantId varchar(6),
    foreign key (RestaurantId) references Restaurants (RestaurantId),
    ItemName varchar(200) not null,
    Item_description  VARCHAR(255),
    price  float not null,
    availability  varchar(200)
);

create table if not exists Orders (
	OrderId varchar(6) Primary key ,
	CustomerId Int,
    foreign key (CustomerId) references Customers (CustomerId),
    RestaurantId varchar(6),
    foreign key (RestaurantId) references Restaurants (RestaurantId),
	total_amount float not null,
    Order_status VARCHAR(255) not null,
    order_date   date not null
);

create table if not exists Orders_item (
	order_item_id varchar(6) Primary key, 
	OrderId varchar(6),
    foreign key (OrderId) references Orders (OrderId),    
	CustomerId Int,
    foreign key (CustomerId) references Customers (CustomerId),
    RestaurantId varchar(6),
    foreign key (RestaurantId) references Restaurants (RestaurantId),
	ItemId varchar(6),
    foreign key (ItemId) references Menu_Items (ItemId),
	Quantity int,
    price float
);

create table if not exists Deliveries_Person (
	delivery_person_id  varchar(6) Primary key, 
	Person_Name varchar(50) not null,
    Phone_number varchar(15) not null,
	availability varchar(15) not null,
    rating float
);

create table if not exists Deliveries (
	Delivery_id varchar(6) Primary key, 
	OrderId varchar(6),
    foreign key (OrderId) references Orders (OrderId), 
	delivery_person_id varchar(6),
    foreign key (delivery_person_id) references Deliveries_Person (delivery_person_id), 
    Delivery_status varchar(20),
    estimated_delivery_time timestamp not null,
    actual_delivery_time timestamp not null  
);

create table if not exists payments (
	payment_id  varchar(6) Primary key, 
	OrderId varchar(6),
    foreign key (OrderId) references Orders (OrderId), 
	CustomerId Int,
    foreign key (CustomerId) references Customers (CustomerId), 
    amount float not null,
    payment_method varchar(50),
    Payment_status varchar(20),
	Payment_date date
);

ALTER TABLE Customers MODIFY COLUMN Customer_phone VARCHAR(255);
ALTER TABLE Restaurants MODIFY COLUMN Restaurant_phone VARCHAR(255);
alter table Deliveries modify column actual_delivery_time timestamp null;

INSERT INTO Customers (CustomerId, CustomerName, Customer_Email, Customer_phone, Customer_address)
VALUES (1, 'Abhishek Sharma', 'abhisheksh@example.com', '9876543210', '123 Main St, Mumbai, Maharashtra 400054'),
  (2, 'Aishwarya Rai', 'aishwaryarai@example.com', '+91 9876543211', '456 Elm St, Delhi, Delhi 110011'),
  (3, 'Amitabh Bachchan', 'amitabhb@example.com', '+91 9876543212', '789 Oak St, Kolkata, West Bengal 700071'),
  (4, 'Deepika Padukone', 'deepikapadukone@example.com', '+91 98765 43213', '101 Pine St, Bangalore, Karnataka 560025'),
  (5, 'Hrithik Roshan', 'hrithikroshan@example.com', '+91 98765 43214', '222 Maple St, Chennai, Tamil Nadu 600014'),
  (6, 'Kareena Kapoor', 'kareenakapoor@example.com', '+91 98765 43215', '333 Cedar St, Hyderabad, Telangana 500032'),
  (7, 'Priyanka Chopra', 'priyankachopra@example.com', '+91 98765 43216', '444 Walnut St, Pune, Maharashtra 411001'),
  (8, 'Ranbir Kapoor', 'ranbirkapoor@example.com', '+91 98765 43217', '555 Willow St, Jaipur, Rajasthan 302001'),
  (9, 'Salman Khan', 'salmankhan@example.com', '+91 98765 43218', '666 Birch St, Lucknow, Uttar Pradesh 226001'),
  (10, 'Shah Rukh Khan', 'shahrukhkhan@example.com', '+91 98765 43219', '777 Aspen St, Ahmedabad, Gujarat 380001'),
  (11, 'Ajay Devgn', 'ajaydevgn@example.com', '9876543251', '100 Park Ave, Mumbai, Maharashtra 400060'),
  (12, 'Madhuri Dixit', 'madhuridixit@example.com', '9876543252', '101 Sea Rd, Delhi, Delhi 110012'),
  (13, 'Shilpa Shetty', 'shilpashetty@example.com', '9876543253', '102 Lake View, Kolkata, West Bengal 700072'),
  (14, 'Irfan Khan', 'irfankhan@example.com', '9876543254', '103 Pearl St, Bangalore, Karnataka 560045'),
  (15, 'John Abraham', 'johnabraham@example.com', '9876543255', '104 Palm St, Chennai, Tamil Nadu 600054'),
  (16, 'Kajol Mukherjee', 'kajolm@example.com', '9876543256', '105 Maple St, Hyderabad, Telangana 500033'),
  (17, 'Aditi Rao Hydari', 'aditirao@example.com', '9876543257', '106 Cedar St, Pune, Maharashtra 411002'),
  (18, 'Parineeti Chopra', 'parineetichopra@example.com', '9876543258', '107 Walnut St, Jaipur, Rajasthan 302002'),
  (19, 'Saif Ali Khan', 'saifalikhan@example.com', '9876543259', '108 Birch St, Lucknow, Uttar Pradesh 226002'),
  (20, 'Sonakshi Sinha', 'sonakshi@example.com', '9876543260', '109 Aspen St, Ahmedabad, Gujarat 380002'),
  (21, 'Vidya Balan', 'vidyabalan@example.com', '9876543261', '110 Coral St, Mumbai, Maharashtra 400061'),
  (22, 'Sunny Leone', 'sunnyleone@example.com', '9876543262', '111 Ruby St, Delhi, Delhi 110013'),
  (23, 'Arjun Kapoor', 'arjunkapoor@example.com', '9876543263', '112 Emerald St, Kolkata, West Bengal 700073'),
  (24, 'Sonu Sood', 'sonusood@example.com', '9876543264', '113 Opal St, Bangalore, Karnataka 560046'),
  (25, 'Tiger Shroff', 'tigershroff@example.com', '9876543265', '114 Amethyst St, Chennai, Tamil Nadu 600055'),
  (26, 'Disha Patani', 'dishapatani@example.com', '9876543266', '115 Sapphire St, Hyderabad, Telangana 500034'),
  (27, 'Kangana Ranaut', 'kanganaranaut@example.com', '9876543267', '116 Topaz St, Pune, Maharashtra 411003'),
  (28, 'Nawazuddin Siddiqui', 'nawazuddin@example.com', '9876543268', '117 Turquoise St, Jaipur, Rajasthan 302003'),
  (29, 'Kartik Aaryan', 'kartikaaryan@example.com', '9876543269', '118 Jade St, Lucknow, Uttar Pradesh 226003'),
  (30, 'Kriti Sanon', 'kritisanon@example.com', '9876543270', '119 Onyx St, Ahmedabad, Gujarat 380003'),
  (31, 'Neha Dhupia', 'nehadhupia@example.com', '9876543271', '120 Garnet St, Mumbai, Maharashtra 400062'),
  (32, 'Rajkummar Rao', 'rajkummar@example.com', '9876543272', '121 Agate St, Delhi, Delhi 110014'),
  (33, 'Yami Gautam', 'yamigautam@example.com', '9876543273', '122 Amber St, Kolkata, West Bengal 700074'),
  (34, 'Emraan Hashmi', 'emraanhashmi@example.com', '9876543274', '123 Diamond St, Bangalore, Karnataka 560047'),
  (35, 'Pankaj Tripathi', 'pankajtripathi@example.com', '9876543275', '124 Jade St, Chennai, Tamil Nadu 600056'),
  (36, 'Taapsee Pannu', 'taapsee@example.com', '9876543276', '125 Turquoise St, Hyderabad, Telangana 500035'),
  (37, 'Sidharth Malhotra', 'sidharth@example.com', '9876543277', '126 Sapphire St, Pune, Maharashtra 411004'),
  (38, 'Manoj Bajpayee', 'manoj@example.com', '9876543278', '127 Ruby St, Jaipur, Rajasthan 302004'),
  (39, 'Radhika Apte', 'radhika@example.com', '9876543279', '128 Coral St, Lucknow, Uttar Pradesh 226004'),
  (40, 'Bhumi Pednekar', 'bhumipednekar@example.com', '9876543280', '129 Emerald St, Ahmedabad, Gujarat 380004'),
  (41, 'Ali Fazal', 'alifazal@example.com', '9876543281', '130 Diamond St, Mumbai, Maharashtra 400063'),
  (42, 'Bobby Deol', 'bobbydeol@example.com', '9876543282', '131 Agate St, Delhi, Delhi 110015'),
  (43, 'Vicky Kaushal', 'vickykaushal@example.com', '9876543283', '132 Onyx St, Kolkata, West Bengal 700075'),
  (44, 'Sanya Malhotra', 'sanyamalhotra@example.com', '9876543284', '133 Amber St, Bangalore, Karnataka 560048'),
  (45, 'Naseeruddin Shah', 'naseeruddin@example.com', '9876543285', '134 Garnet St, Chennai, Tamil Nadu 600057'),
  (46, 'Zarina Wahab', 'zarina@example.com', '9876543286', '135 Topaz St, Hyderabad, Telangana 500036'),
  (47, 'Jimmy Shergill', 'jimmyshergill@example.com', '9876543287', '136 Sapphire St, Pune, Maharashtra 411005'),
  (48, 'Amrita Rao', 'amritarao@example.com', '9876543288', '137 Ruby St, Jaipur, Rajasthan 302005'),
  (49, 'Aditya Roy Kapoor', 'adityaroy@example.com', '9876543289', '138 Onyx St, Lucknow, Uttar Pradesh 226005'),
  (50, 'Shraddha Kapoor', 'shraddhakapoor@example.com', '9876543290', '139 Coral St, Ahmedabad, Gujarat 380005');

INSERT INTO Restaurants (RestaurantId, RestaurantName, Restaurant_phone, Restaurant_address, Cuisine, Rating)
VALUES
  ('R001', 'Pizza Hut', '+91 12345 67890', '123 Main St, Mumbai, Maharashtra 400054', 'Italian', 4.2),
  ('R002', 'Domino\'s Pizza', '+91 23456 78901', '456 Elm St, Delhi, Delhi 110011', 'Italian', 4.5),
  ('R003', 'McDonald\'s', '+91 34567 89012', '789 Oak St, Kolkata, West Bengal 700071', 'Fast Food', 3.8),
  ('R004', 'KFC', '+91 45678 90123', '101 Pine St, Bangalore, Karnataka 560025', 'Fast Food', 4.0),
  ('R005', 'Burger King', '+91 56789 01234', '222 Maple St, Chennai, Tamil Nadu 600014', 'Fast Food', 3.9),
  ('R006', 'Subway', '+91 67890 12345', '333 Cedar St, Hyderabad, Telangana 500032', 'Fast Food', 4.3),
  ('R007', 'Barbeque Nation', '+91 78901 23456', '444 Walnut St, Pune, Maharashtra 411001', 'Barbecue', 4.7),
  ('R008', 'Haldiram\'s', '+91 89012 34567', '555 Willow St, Jaipur, Rajasthan 302001', 'Indian', 4.4),
  ('R009', 'Bikanervala', '+91 90123 45678', '666 Birch St, Lucknow, Uttar Pradesh 226001', 'Indian', 4.2),
  ('R010', 'Sagar Ratna', '+91 12345 67891', '777 Aspen St, Ahmedabad, Gujarat 380001', 'South Indian', 4.6),
  ('R011', 'Starbucks', '+91 98765 43220', '123 King St, Mumbai, Maharashtra 400064', 'Cafe', 4.5),
  ('R012', 'The Great Kebab Factory', '+91 98765 43221', '124 Queen St, Delhi, Delhi 110016', 'Indian', 4.3),
  ('R013', 'The Chinese Wok', '+91 98765 43222', '125 Pearl St, Kolkata, West Bengal 700076', 'Chinese', 4.1),
  ('R014', 'Cafe Coffee Day', '+91 98765 43223', '126 Park St, Bangalore, Karnataka 560049', 'Cafe', 4.0),
  ('R015', 'Saravana Bhavan', '+91 98765 43224', '127 Garden St, Chennai, Tamil Nadu 600058', 'South Indian', 4.4);
  
  INSERT INTO Menu_Items (ItemId, RestaurantId, ItemName, Item_description, Price, Availability)
VALUES
  (1, 'R001', 'Margherita Pizza', 'Classic pizza with tomato, mozzarella, and fresh basil.', 399.99, 'Available'),
  (2, 'R001', 'Veggie Supreme Pizza', 'Loaded pizza with a variety of fresh vegetables.', 499.99, 'Available'),
  (3, 'R001', 'Cheesy Garlic Bread', 'Bread with garlic, cheese, and butter, baked to perfection.', 149.99, 'Available'),
  (4, 'R001', 'Caesar Salad', 'Crisp lettuce with Caesar dressing and croutons.', 179.99, 'Available'),
  (5, 'R001', 'Coca-Cola', 'Classic carbonated soft drink.', 99.99, 'Available');
    INSERT INTO Menu_Items (ItemId, RestaurantId, ItemName, Item_description, Price, Availability)
VALUES
  (6, 'R002', 'Classic Margherita Pizza', 'Tomato, mozzarella, and basil on a crispy crust.', 349.99, 'Available'),
  (7, 'R002', 'Cheese Burst Pizza', 'Pizza with extra cheese bursting from the crust.', 549.99, 'Available'),
  (8, 'R002', 'Garlic Breadsticks', 'Garlic-infused breadsticks served with marinara sauce.', 199.99, 'Available'),
  (9, 'R002', 'Pepsi', 'Refreshing cola beverage.', 99.99, 'Available'),
  (10, 'R002', 'Chocolate Brownie', 'Warm chocolate brownie served with vanilla ice cream.', 199.99, 'Available'),
  (11, 'R003', 'Big Mac', 'A classic burger with two beef patties, lettuce, cheese, and sauce.', 259.99, 'Available'),
  (12, 'R003', 'McVeggie Burger', 'A crispy vegetable patty with lettuce and mayo.', 179.99, 'Available'),
  (13, 'R003', 'French Fries', 'Crispy, golden fries served with ketchup.', 99.99, 'Available'),
  (14, 'R003', 'Coca-Cola', 'Classic soft drink in a can.', 99.99, 'Available'),
  (15, 'R003', 'Apple Pie', 'Warm, flaky pastry filled with apple filling.', 129.99, 'Available'),
  (16, 'R004', 'Zinger Burger', 'Spicy chicken fillet with crunchy lettuce and mayo.', 199.99, 'Available'),
  (17, 'R004', 'Original Recipe Chicken', 'Fried chicken made with KFC’s secret blend of spices.', 299.99, 'Available'),
  (18, 'R004', 'French Fries', 'Crispy, golden fries served with ketchup.', 99.99, 'Available'),
  (19, 'R004', 'Pepsi', 'Refreshing cola beverage.', 99.99, 'Available'),
  (20, 'R004', 'Chocolate Cake', 'Rich and moist chocolate cake served with frosting.', 149.99, 'Available'),
  (21, 'R005', 'Whopper', 'Grilled beef patty with lettuce, tomato, and mayo on a toasted bun.', 289.99, 'Available'),
  (22, 'R005', 'Veggie Whopper', 'Vegetarian patty with fresh veggies and mayo.', 249.99, 'Available'),
  (23, 'R005', 'Onion Rings', 'Crispy fried onion rings served with dipping sauce.', 129.99, 'Available'),
  (24, 'R005', 'Coca-Cola', 'Classic carbonated soft drink.', 99.99, 'Available'),
  (25, 'R005', 'Milkshake', 'Creamy milkshake with flavors like chocolate, vanilla, and strawberry.', 169.99, 'Available'),
  (26, 'R006', 'Veggie Delight Sub', 'Crisp vegetables with choice of bread and sauce.', 159.99, 'Available'),
  (27, 'R006', 'Chicken Teriyaki Sub', 'Grilled chicken with teriyaki sauce and veggies.', 229.99, 'Available'),
  (28, 'R006', 'Italian BMT Sub', 'Salami, pepperoni, and ham with cheese and veggies.', 249.99, 'Available'),
  (29, 'R006', 'Oatmeal Raisin Cookie', 'Soft and chewy oatmeal cookie with raisins.', 69.99, 'Available'),
  (30, 'R006', 'Pepsi', 'Refreshing cola beverage.', 99.99, 'Available'),
  (31, 'R007', 'Barbecue Chicken', 'Tender chicken grilled with smoky barbecue sauce.', 349.99, 'Available'),
  (32, 'R007', 'Paneer Tikka', 'Marinated paneer grilled to perfection.', 249.99, 'Available'),
  (33, 'R007', 'Fish Tikka', 'Marinated fish grilled with spices and served with chutney.', 299.99, 'Available'),
  (34, 'R007', 'Veg Seekh Kebab', 'Spicy vegetable kebabs grilled to perfection.', 199.99, 'Available'),
  (35, 'R007', 'Cucumber Mint Cooler', 'Refreshing cucumber drink with mint leaves.', 149.99, 'Available'),
  (36, 'R008', 'Aloo Tikki', 'Crispy potato patties served with chutneys.', 119.99, 'Available'),
  (37, 'R008', 'Chole Bhature', 'Fried bread served with spicy chickpeas.', 189.99, 'Available'),
  (38, 'R008', 'Samosa', 'Crispy pastry filled with spiced potato and peas.', 49.99, 'Available'),
  (39, 'R008', 'Gulab Jamun', 'Soft, syrupy fried dough balls soaked in sugar syrup.', 79.99, 'Available'),
  (40, 'R008', 'Lassi', 'Traditional yogurt drink with sweet or salty flavors.', 99.99, 'Available'),
  (41, 'R009', 'Kachori', 'Fried pastry filled with spicy lentil mixture.', 89.99, 'Available'),
  (42, 'R009', 'Dhokla', 'Steamed rice and chickpea flour cake with spices.', 129.99, 'Available'),
  (43, 'R009', 'Aloo Paratha', 'Flatbread stuffed with spiced mashed potatoes and served with yogurt.', 149.99, 'Available'),
  (44, 'R009', 'Chana Chaat', 'Spicy chickpea salad with onions, tomatoes, and chutneys.', 159.99, 'Available');
    INSERT INTO Menu_Items (ItemId, RestaurantId, ItemName, Item_description, Price, Availability)
VALUES
  (45, 'R009', 'Masala Tea', 'Spiced tea brewed with milk and cardamom.', 49.99, 'Available'),
  (46, 'R010', 'Rava Dosa', 'Crispy semolina crepe served with coconut chutney and sambar.', 169.99, 'Available'),
  (47, 'R010', 'Idli Sambar', 'Steamed rice cakes served with spicy lentil soup.', 139.99, 'Available'),
  (48, 'R010', 'Masala Uttapam', 'Thick rice pancake topped with spiced vegetables.', 179.99, 'Available'),
  (49, 'R010', 'Vada', 'Fried savory doughnut-shaped snack served with chutney.', 89.99, 'Available'),
  (50, 'R010', 'Filter Coffee', 'Strong and aromatic South Indian filter coffee.', 59.99, 'Available'),
  (51, 'R011', 'Caramel Macchiato', 'Espresso with steamed milk and caramel syrup.', 249.99, 'Available'),
  (52, 'R011', 'Cappuccino', 'Espresso with steamed milk and foam on top.', 219.99, 'Available'),
  (53, 'R011', 'Chocolate Cake', 'Rich and moist chocolate cake with a creamy frosting.', 169.99, 'Available'),
  (54, 'R011', 'Pumpkin Spice Latte', 'Espresso with steamed milk, pumpkin syrup, and spices.', 269.99, 'Available'),
  (55, 'R011', 'Iced Tea', 'Chilled black tea served with lemon.', 129.99, 'Available'),
  (56, 'R012', 'Mutton Seekh Kebab', 'Minced mutton grilled on skewers with spices.', 329.99, 'Available'),
  (57, 'R012', 'Paneer Shashlik', 'Grilled paneer with vegetables and spices.', 279.99, 'Available'),
  (58, 'R012', 'Tandoori Chicken', 'Spicy chicken marinated and grilled in a clay oven.', 299.99, 'Available'),
  (59, 'R012', 'Lassi', 'Traditional yogurt drink, served sweet or salty.', 99.99, 'Available'),
  (60, 'R012', 'Kebabs Platter', 'Assorted kebabs served with bread and chutneys.', 399.99, 'Available'),
  (61, 'R013', 'Chili Chicken', 'Boneless chicken in a spicy Chinese sauce.', 249.99, 'Available'),
  (62, 'R013', 'Veg Hakka Noodles', 'Stir-fried noodles with mixed vegetables and soy sauce.', 179.99, 'Available'),
  (63, 'R013', 'Spring Rolls', 'Crispy rolls filled with vegetables and served with dip.', 129.99, 'Available'),
  (64, 'R013', 'Sweet Corn Soup', 'Creamy corn soup with a hint of pepper.', 99.99, 'Available'),
  (65, 'R013', 'Gobi Manchurian', 'Crispy cauliflower in a spicy Chinese sauce.', 169.99, 'Available'),
  (66, 'R014', 'Espresso', 'Strong black coffee served in a small cup.', 129.99, 'Available'),
  (67, 'R014', 'Latte', 'Espresso with steamed milk and a light foam.', 169.99, 'Available'),
  (68,  'R014', 'Cold Coffee', 'Iced coffee blended with milk and ice cream.', 199.99, 'Available'),
  (69,  'R014', 'Chocolate Truffle Cake', 'Rich chocolate cake with a creamy truffle filling.', 179.99, 'Available'),
  (70,  'R014', 'Tiramisu', 'Classic Italian dessert with coffee-flavored layers.', 199.99, 'Available'),
  (71, 'R015', 'Mini Tiffin', 'A variety of South Indian dishes including idli, vada, and sambar.', 199.99, 'Available'),
  (72, 'R015', 'Sambar Rice', 'Rice mixed with spicy lentil-based sambar.', 149.99, 'Available'),
  (73, 'R015', 'Masala Dosa', 'Crispy dosa stuffed with spicy mashed potatoes.', 139.99, 'Available'),
  (74, 'R015', 'Rasam', 'Tangy South Indian soup made with tamarind and spices.', 89.99, 'Available'),
  (75, 'R015', 'Medu Vada', 'Fried savory doughnuts made from lentils, served with chutney.', 99.99, 'Available');

INSERT INTO Orders (OrderId, CustomerId, RestaurantId, total_amount, Order_status, order_date)
VALUES
  ('O001', 1, 'R001', 1200.99, 'Delivered', '2024-10-01'),
  ('O002', 1, 'R002', 750.50, 'Delivered', '2024-10-05'),
  ('O003', 1, 'R003', 450.00, 'Cancelled', '2024-10-10'),
  ('O004', 2, 'R004', 980.75, 'Delivered', '2024-10-03'),
  ('O005', 2, 'R005', 540.30, 'Delivered', '2024-10-08'),
  ('O006', 2, 'R008', 650.00, 'Pending', '2024-10-12'),
  ('O007', 3, 'R006', 1120.00, 'Delivered', '2024-10-02'),
  ('O008', 3, 'R010', 1300.50, 'Delivered', '2024-10-06'),
  ('O009', 3, 'R007', 860.30, 'Pending', '2024-10-10'),
  ('O010', 4, 'R002', 950.00, 'Delivered', '2024-10-04'),
  ('O011', 4, 'R003', 650.75, 'Cancelled', '2024-10-09'),
  ('O012', 4, 'R004', 800.60, 'Delivered', '2024-10-11'),
  ('O013', 5, 'R005', 950.40, 'Delivered', '2024-10-01'),
  ('O014', 5, 'R008', 1200.00, 'Pending', '2024-10-07'),
  ('O015', 5, 'R007', 800.20, 'Delivered', '2024-10-10'),
  ('O016', 6, 'R009', 850.50, 'Delivered', '2024-10-02'),
  ('O017', 6, 'R006', 450.00, 'Cancelled', '2024-10-06'),
  ('O018', 6, 'R010', 1300.00, 'Pending', '2024-10-11'),
  ('O019', 7, 'R008', 700.25, 'Delivered', '2024-10-03'),
  ('O020', 7, 'R009', 1100.00, 'Pending', '2024-10-09'),
  ('O021', 7, 'R002', 750.75, 'Delivered', '2024-10-12'),
  ('O022', 8, 'R003', 480.30, 'Delivered', '2024-10-01'),
  ('O023', 8, 'R004', 720.50, 'Cancelled', '2024-10-05'),
  ('O024', 8, 'R006', 550.00, 'Delivered', '2024-10-08'),
  ('O025', 9, 'R005', 800.75, 'Delivered', '2024-10-04'),
  ('O026', 9, 'R007', 900.00, 'Delivered', '2024-10-08'),
  ('O027', 9, 'R003', 670.60, 'Pending', '2024-10-12'),
  ('O028', 10, 'R010', 950.00, 'Delivered', '2024-10-02'),
  ('O029', 10, 'R006', 510.00, 'Cancelled', '2024-10-06'),
  ('O030', 10, 'R007', 780.30, 'Pending', '2024-10-10'),
  ('O031', 11, 'R001', 850.30, 'Delivered', '2024-10-03'),
  ('O032', 11, 'R009', 1100.00, 'Cancelled', '2024-10-07'),
  ('O033', 11, 'R002', 950.50, 'Delivered', '2024-10-11'),
  ('O034', 12, 'R004', 1200.00, 'Delivered', '2024-10-02'),
  ('O035', 12, 'R006', 800.75, 'Delivered', '2024-10-06'),
  ('O036', 12, 'R007', 700.30, 'Pending', '2024-10-10'),
  ('O037', 13, 'R008', 650.60, 'Delivered', '2024-10-01'),
  ('O038', 13, 'R002', 900.50, 'Cancelled', '2024-10-05'),
  ('O039', 13, 'R010', 1250.75, 'Pending', '2024-10-09'),
  ('O040', 14, 'R001', 1050.90, 'Delivered', '2024-10-04'),
  ('O041', 14, 'R003', 550.30, 'Delivered', '2024-10-08'),
  ('O042', 14, 'R005', 720.20, 'Pending', '2024-10-12'),
  ('O043', 15, 'R007', 930.60, 'Delivered', '2024-10-02'),
  ('O044', 15, 'R004', 870.50, 'Cancelled', '2024-10-06'),
  ('O045', 15, 'R009', 1100.00, 'Delivered', '2024-10-10'),
  ('O046', 16, 'R006', 980.40, 'Delivered', '2024-10-01'),
  ('O047', 16, 'R010', 1200.20, 'Pending', '2024-10-05'),
  ('O048', 16, 'R003', 770.00, 'Delivered', '2024-10-09'),
  ('O049', 17, 'R008', 850.00, 'Delivered', '2024-10-03'),
  ('O050', 17, 'R005', 930.30, 'Cancelled', '2024-10-07'),
  ('O051', 17, 'R002', 700.60, 'Pending', '2024-10-10'),
  ('O052', 18, 'R009', 980.10, 'Delivered', '2024-10-04'),
  ('O053', 18, 'R007', 870.50, 'Cancelled', '2024-10-08'),
  ('O054', 18, 'R003', 1050.00, 'Delivered', '2024-10-12'),
  ('O055', 19, 'R004', 800.30, 'Delivered', '2024-10-01'),
  ('O056', 19, 'R005', 950.20, 'Delivered', '2024-10-05'),
  ('O057', 19, 'R006', 600.50, 'Pending', '2024-10-10'),
  ('O058', 20, 'R003', 450.30, 'Delivered', '2024-10-02'),
  ('O059', 20, 'R008', 1100.75, 'Cancelled', '2024-10-06'),
  ('O060', 20, 'R009', 1200.60, 'Pending', '2024-10-10');
  
 INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI001', 'O001', 1, 'R001', 01, 2, 400.00),  -- 2 Pizzas from Pizza Hut
  ('OI002', 'O001', 1, 'R001', 03, 1, 350.00);
   INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI003', 'O002', 2, 'R002', 07, 2, 600.00),  -- 2 Pizzas from Domino's
  ('OI004', 'O002', 2, 'R002', 09, 1, 250.00),
  ('OI005', 'O003', 3, 'R003', 10, 1, 450.00),  -- 1 Burger from McDonald's
  ('OI006', 'O003', 3, 'R003', 12, 2, 500.00);  -- 2 Fries from McDonald's

-- Orders Items for OrderId O004 (CustomerId 4, Deepika Padukone)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI007', 'O004', 4, 'R004', 15, 1, 350.00),  -- 1 Chicken Bucket from KFC
  ('OI008', 'O004', 4, 'R004', 17, 2, 400.00);  -- 2 French Fries from KFC

-- Orders Items for OrderId O005 (CustomerId 5, Hrithik Roshan)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI009', 'O005', 5, 'R005', 20, 1, 550.00),  -- 1 Whopper from Burger King
  ('OI010', 'O005', 5, 'R005', 22, 2, 420.00);  -- 2 Fries from Burger King

-- Orders Items for OrderId O006 (CustomerId 6, Kareena Kapoor)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI011', 'O006', 6, 'R006', 25, 1, 300.00),  -- 1 Sub Sandwich from Subway
  ('OI012', 'O006', 6, 'R006', 27, 3, 600.00);  -- 3 Drinks from Subway

-- Orders Items for OrderId O007 (CustomerId 7, Priyanka Chopra)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI013', 'O007', 7, 'R007', 30, 1, 600.00),  -- 1 Chicken Tikka from Barbeque Nation
  ('OI014', 'O007', 7, 'R007', 32, 2, 500.00);  -- 2 Paneer Tikka from Barbeque Nation

-- Orders Items for OrderId O008 (CustomerId 8, Ranbir Kapoor)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI015', 'O008', 8, 'R008', 35, 2, 500.00),  -- 2 Samosas from Haldiram's
  ('OI016', 'O008', 8, 'R008', 37, 1, 200.00);  -- 1 Chutney from Haldiram's

-- Orders Items for OrderId O009 (CustomerId 9, Salman Khan)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI017', 'O009', 9, 'R009', 40, 2, 700.00),  -- 2 Chole Bhature from Bikanervala
  ('OI018', 'O009', 9, 'R009', 42, 1, 400.00);  -- 1 Lassi from Bikanervala

-- Orders Items for OrderId O010 (CustomerId 10, Shah Rukh Khan)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI019', 'O010', 10, 'R010', 45, 1, 600.00),  -- 1 Dosa from Sagar Ratna
  ('OI020', 'O010', 10, 'R010', 47, 2, 500.00);  -- 2 Idlis from Sagar Ratna
-- Orders Items for OrderId O011 (CustomerId 11, Ajay Devgn)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI021', 'O011', 11, 'R011', 50, 2, 500.00),  -- 2 Coffees from Starbucks
  ('OI022', 'O011', 11, 'R011', 52, 1, 300.00);  -- 1 Muffin from Starbucks

-- Orders Items for OrderId O012 (CustomerId 12, Madhuri Dixit)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI023', 'O012', 12, 'R012', 55, 1, 450.00),  -- 1 Kebab from The Great Kebab Factory
  ('OI024', 'O012', 12, 'R012', 57, 2, 600.00);  -- 2 Naan from The Great Kebab Factory

-- Orders Items for OrderId O013 (CustomerId 13, Shilpa Shetty)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI025', 'O013', 13, 'R013', 60, 1, 350.00),  -- 1 Fried Rice from The Chinese Wok
  ('OI026', 'O013', 13, 'R013', 62, 2, 400.00);  -- 2 Spring Rolls from The Chinese Wok

-- Orders Items for OrderId O014 (CustomerId 14, Irfan Khan)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI027', 'O014', 14, 'R014', 65, 2, 400.00),  -- 2 Coffees from Cafe Coffee Day
  ('OI028', 'O014', 14, 'R014', 67, 1, 350.00);  -- 1 Sandwich from Cafe Coffee Day

-- Orders Items for OrderId O015 (CustomerId 15, John Abraham)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI029', 'O015', 15, 'R015', 70, 1, 600.00),  -- 1 Masala Dosa from Saravana Bhavan
  ('OI030', 'O015', 15, 'R015', 72, 3, 450.00);  -- 3 Vadas from Saravana Bhavan

-- Orders Items for OrderId O016 (CustomerId 16, Kajol Mukherjee)
INSERT INTO Orders_item (order_item_id, OrderId, CustomerId, RestaurantId, ItemId, Quantity, price)
VALUES
  ('OI031', 'O016', 16, 'R016', 75, 2, 700.00),  -- 2 Veg Burgers from McDonald's
  ('OI032', 'O016', 16, 'R016', 77, 1, 250.00);  -- 1 Milkshake from McDonald's


INSERT INTO Deliveries_Person (delivery_person_id, Person_Name, Phone_number, availability, rating)
VALUES
  ('DP011', 'Akash Gupta', '+91 12345 67811', 'Available', 4.7),
  ('DP012', 'Rohan Das', '+91 23456 78912', 'Busy', 4.5),
  ('DP013', 'Anjali Bose', '+91 34567 89013', 'Available', 4.6),
  ('DP014', 'Vikram Singh', '+91 45678 90114', 'Available', 4.8),
  ('DP015', 'Raj Mehta', '+91 56789 01215', 'Busy', 4.2),
  ('DP016', 'Neha Verma', '+91 67890 12316', 'Available', 4.9),
  ('DP017', 'Suman Mishra', '+91 78901 23417', 'Busy', 4.3),
  ('DP018', 'Karan Patel', '+91 89012 34518', 'Available', 4.4),
  ('DP019', 'Priya Shah', '+91 90123 45619', 'Busy', 4.6),
  ('DP020', 'Aman Rathore', '+91 12345 67820', 'Available', 4.1);


INSERT INTO Deliveries (Delivery_id, OrderId, delivery_person_id, Delivery_status, estimated_delivery_time, actual_delivery_time)
VALUES
  ('D001', 'O001', 'DP011', 'Delivered', '2024-11-08 12:30:00', '2024-11-08 12:35:00'),
  ('D002', 'O002', 'DP012', 'Pending', '2024-11-08 13:00:00', NULL),
  ('D003', 'O003', 'DP013', 'Delivered', '2024-11-08 14:00:00', '2024-11-08 14:05:00'),
  ('D004', 'O004', 'DP014', 'Delivered', '2024-11-08 14:30:00', '2024-11-08 14:40:00'),
  ('D005', 'O005', 'DP015', 'Cancelled', '2024-11-08 15:00:00', NULL),
  ('D006', 'O006', 'DP016', 'Delivered', '2024-11-08 15:30:00', '2024-11-08 15:35:00'),
  ('D007', 'O007', 'DP017', 'Pending', '2024-11-08 16:00:00', NULL),
  ('D008', 'O008', 'DP018', 'Delivered', '2024-11-08 16:30:00', '2024-11-08 16:40:00'),
  ('D009', 'O009', 'DP019', 'Delivered', '2024-11-08 17:00:00', '2024-11-08 17:10:00'),
  ('D010', 'O010', 'DP020', 'Delivered', '2024-11-08 17:30:00', '2024-11-08 17:35:00'),
  ('D011', 'O011', 'DP011', 'Delivered', '2024-11-08 18:00:00', '2024-11-08 18:05:00'),
  ('D012', 'O012', 'DP012', 'Pending', '2024-11-08 18:30:00', NULL),
  ('D013', 'O013', 'DP013', 'Delivered', '2024-11-08 19:00:00', '2024-11-08 19:10:00'),
  ('D014', 'O014', 'DP014', 'Delivered', '2024-11-08 19:30:00', '2024-11-08 19:40:00'),
  ('D015', 'O015', 'DP015', 'Cancelled', '2024-11-08 20:00:00', NULL),
  ('D016', 'O016', 'DP016', 'Delivered', '2024-11-08 20:30:00', '2024-11-08 20:35:00'),
  ('D017', 'O017', 'DP017', 'Pending', '2024-11-08 21:00:00', NULL),
  ('D018', 'O018', 'DP018', 'Delivered', '2024-11-08 21:30:00', '2024-11-08 21:40:00'),
  ('D019', 'O019', 'DP019', 'Delivered', '2024-11-08 22:00:00', '2024-11-08 22:10:00'),
  ('D020', 'O020', 'DP020', 'Delivered', '2024-11-08 22:30:00', '2024-11-08 22:35:00');

INSERT INTO payments (payment_id, OrderId, CustomerId, amount, payment_method, Payment_status, Payment_date)
VALUES
  ('P001', 'O001', 1, 500.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P002', 'O002', 2, 800.00, 'Debit Card', 'Pending', '2024-11-08'),
  ('P003', 'O003', 3, 600.00, 'UPI', 'Completed', '2024-11-08'),
  ('P004', 'O004', 4, 450.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P005', 'O005', 5, 1200.00, 'Cash', 'Cancelled', '2024-11-08'),
  ('P006', 'O006', 6, 750.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P007', 'O007', 7, 650.00, 'UPI', 'Completed', '2024-11-08'),
  ('P008', 'O008', 8, 1000.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P009', 'O009', 9, 550.00, 'Cash', 'Completed', '2024-11-08'),
  ('P010', 'O010', 10, 900.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P011', 'O011', 11, 450.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P012', 'O012', 12, 1200.00, 'UPI', 'Pending', '2024-11-08'),
  ('P013', 'O013', 13, 550.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P014', 'O014', 14, 700.00, 'Cash', 'Completed', '2024-11-08'),
  ('P015', 'O015', 15, 800.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P016', 'O016', 16, 950.00, 'UPI', 'Completed', '2024-11-08'),
  ('P017', 'O017', 17, 650.00, 'Debit Card', 'Pending', '2024-11-08'),
  ('P018', 'O018', 18, 500.00, 'Cash', 'Completed', '2024-11-08'),
  ('P019', 'O019', 19, 850.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P020', 'O020', 20, 1050.00, 'UPI', 'Completed', '2024-11-08'),
  ('P021', 'O021', 21, 950.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P022', 'O022', 22, 1100.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P023', 'O023', 23, 600.00, 'Cash', 'Completed', '2024-11-08'),
  ('P024', 'O024', 24, 750.00, 'UPI', 'Completed', '2024-11-08'),
  ('P025', 'O025', 25, 1200.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P026', 'O026', 26, 800.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P027', 'O027', 27, 550.00, 'UPI', 'Completed', '2024-11-08'),
  ('P028', 'O028', 28, 650.00, 'Cash', 'Pending', '2024-11-08'),
  ('P029', 'O029', 29, 950.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P030', 'O030', 30, 700.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P031', 'O031', 31, 1000.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P032', 'O032', 32, 800.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P033', 'O033', 33, 650.00, 'UPI', 'Pending', '2024-11-08'),
  ('P034', 'O034', 34, 900.00, 'Cash', 'Completed', '2024-11-08'),
  ('P035', 'O035', 35, 750.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P036', 'O036', 36, 950.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P037', 'O037', 37, 800.00, 'UPI', 'Completed', '2024-11-08'),
  ('P038', 'O038', 38, 1100.00, 'Cash', 'Pending', '2024-11-08'),
  ('P039', 'O039', 39, 600.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P040', 'O040', 40, 1050.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P041', 'O041', 41, 900.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P042', 'O042', 42, 750.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P043', 'O043', 43, 850.00, 'UPI', 'Completed', '2024-11-08'),
  ('P044', 'O044', 44, 1200.00, 'Cash', 'Pending', '2024-11-08'),
  ('P045', 'O045', 45, 950.00, 'Credit Card', 'Completed', '2024-11-08'),
  ('P046', 'O046', 46, 700.00, 'Debit Card', 'Completed', '2024-11-08'),
  ('P047', 'O047', 47, 650.00, 'UPI', 'Completed', '2024-11-08'),
  ('P048', 'O048', 48, 800.00, 'Cash', 'Completed', '2024-11-08'),
  ('P049', 'O049', 49, 1050.00, 'Credit Card', 'Pending', '2024-11-08'),
  ('P050', 'O050', 50, 1100.00, 'Debit Card', 'Completed', '2024-11-08');


