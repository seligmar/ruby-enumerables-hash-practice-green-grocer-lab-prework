require "pry" 
 

def consolidate_cart(cart)
 total = {}
  cart.each do |item|
    item.each do |food, info|
      if total[food]
        total[food][:count] += 1
      else
        total[food] = info 
        total[food][:count] = 1
      end
    end
  end
  total 
end	

 #binding.pry 
def apply_coupons(cart, coupons)
   coupons.each do |sale| # loops over each item within the coupon hash 
      if cart.keys.include?(sale[:item]) #check if a coupon applies to something in the cart 
          cart["#{sale[:item]} W/COUPON"] = {:price => (sale[:cost] = sale[:cost] / sale[:num]), :clearance => (cart[sale[:item]][:clearance]), :count => sale[:num]}
      end
      if cart.keys.include?(sale[:item]) && cart[sale[:item]][:count] >= sale[:num] 
      cart[sale[:item]][:count] -= sale[:num]
     end 
   end
 cart 
end



def apply_clearance(cart)
   cart.each do |item, info|
  if info[:clearance] 
      (info[:price] = info[:price] * 0.8)
      info[:price] = info[:price].round(2)  
 end  
 end 
 cart
end

def checkout(cart, coupons)
  #.reduce.do ||
 # consolidate_cart
#  apply_coupons
#  apply_clearance
 # if total > 100
 #   total = total.round(2)
end