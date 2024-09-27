/// @description Insert description here
// You can write your code in this editor
if(other == whichCustomerMovingTowards){
	instance_destroy();	
	instance_destroy(other);
	obj_manager.currentMoney += whichCustomerMovingTowards.moneyTheyWillPay;
}