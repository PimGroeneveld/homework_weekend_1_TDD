def pet_shop_name (petshop_name)
  return petshop_name[:name]
end

def total_cash(sum_cash)
  return sum_cash[:admin][:total_cash]
end

def add_or_remove_cash(sum_cash, add_cash)
  new_cash = sum_cash[:admin][:total_cash]+add_cash
  sum_cash[:admin][:total_cash] = new_cash
  return new_cash
end

def pets_sold(amount_sold_pets)
  return amount_sold_pets[:admin][:pets_sold]
end

def increase_pets_sold(current_pets, extra_sold)
  sold_pets = current_pets[:admin][:pets_sold] + extra_sold
  current_pets[:admin][:pets_sold] = sold_pets
  return sold_pets
end

def stock_count(pet_stock)
  return pet_stock[:pets].count()
end

# needs to make new aray, loop through array items, and return matching pets

def pets_by_breed(pets, pet_breed)
  result = []
  for breed in pets[:pets]
      if breed[:breed] == pet_breed
        result.push(breed)
      end
  end
  return result
end

# dont think this is correct, does run without errors though
def find_pet_by_name(pet_shop, name)
 pets = pets
  for pet in pet_shop[:pets]
    if pet[:name] == name
     pets = pet
     nil
    end
  end
 return pets
end

# This is the one that seemed like "the right way"to me, but  could only get one of the two to work at the same time. without Nil, the "arthur" test works, with the Nil, only the Nil test works :(
# def find_pet_by_name(pet_shop, name)
#  pets = []
#   for pet in pet_shop[:pets]
#     if pet[:name] == name
#      pets = pet
#     else
#      pets = nil
#     end
#   end
#  return pets
# end

#assert_true or assert_nil only focus on their respective outcomes
#assert_true(result) instead of assert_equal(true, result)

def remove_pet_by_name(pets, pet_to_remove)
  pets[:pets].delete_if { |name| name[:name] == pet_to_remove }
end

def add_pet_to_stock(pets_in_stock, new_pet)
  pets_in_stock[:pets] << new_pet
end

def customer_cash(amount_cash)
  return amount_cash[:cash]
end

def remove_customer_cash(customer_cash, cash_to_remove)
  # note: - needed since they put in 100
  return customer_cash[:cash] -= cash_to_remove
end

def customer_pet_count(amount_pets)
  return amount_pets[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

# additional
def customer_can_afford_pet(customer_money, new_pet_price)
  if customer_money[:cash] >= new_pet_price[:price]
    return true
  else
    return false
  end
end

# struggled with this one a bit
# note to self: remember function logic -> "customer[:pets] << pet" should be above "pet_shop[:admin][:pets_sold] += [:pets].count()" to make the count work
def sell_pet_to_customer(pet_shop, pet, customer)
  if
    pet_shop[:admin][:total_cash] += pet[:price]
    customer[:cash] -= pet[:price]
  else
    p "Not enough dough :( "
  end
  customer[:pets] << pet
  pet_shop[:admin][:pets_sold] += [:pets].count()
end
#ask: how to count a nested hash in an array as one item?
