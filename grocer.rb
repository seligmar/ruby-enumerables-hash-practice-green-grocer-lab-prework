require "pry" 

def consolidate_cart(cart)
  new = {}
  cart.each_with_index do |item|
    item.each do |food, info|
      if new[food]
        new[food][:count] += 1
      else
        new[food] = info
        new[food][:count] = 1
      end
    end
  end
  new
end

def apply_coupons(cart, coupons)
   coupons.each do |sale| # loops over each item within the coupon hash 
      if cart.keys.include?(sale[:item]) #check if a coupon applies to something in the cart 
          if cart[sale[:item]][:count] >= sale[:num]   
          cart[sale[:item]][:count] -= sale[:num]
              new_key = "#{sale[:item]} W/COUPON" 
                if cart.keys.include?(new_key)
                  cart[new_key][:count] += sale[:num]
                  else 
                    cart[new_key] = {:price => sale[:cost] / sale[:num], :clearance => cart[sale[:item]][:clearance], :count => sale[:num]}
                    
        end 
      end
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
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(couponed_cart)
  total = 0
  final_cart.each do |name, properties|
    total += properties[:price] * properties[:count]
  end
  total = total * 0.9 if total > 100
  total
end