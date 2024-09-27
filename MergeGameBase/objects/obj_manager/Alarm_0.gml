/// @description Generate Customers
// You can write your code in this editor

x_pos = random_range(0, room_width);
y_pos = random_range(70, 100);

instance_create_layer(x_pos, y_pos,"Instances", obj_customer);

alarm[0] = irandom_range(1200, 2400);