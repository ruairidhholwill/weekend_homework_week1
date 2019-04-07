def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, money_to_be_added_or_removed)
  pet_shop[:admin][:total_cash] += money_to_be_added_or_removed
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_pets_sold)
  pet_shop[:admin][:pets_sold] += number_of_pets_sold
end

def stock_count(pet_shop)
  pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed_name)
  array_pets = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed_name
      array_pets.push(pet)
    end
  end
  return array_pets
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  pet = find_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(pet)
end

def add_pet_to_stock(pet_shop, new_pet)
  count_array = pet_shop[:pets]
  return count_array.push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash_amount_to_remove)
  customer[:cash] -= cash_amount_to_remove
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  return customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet && customer_can_afford_pet(customer, pet)
    customer[:pets].push(pet)
    pet_shop[:admin][:pets_sold] += 1
    customer[:cash] -= pet[:price]
    pet_shop[:admin][:total_cash] += pet[:price]
  end
end
