# string_frozen_literal: true

class Menu
  def self.display
    puts("Menu :")
    puts("0. Create sample Bus data")
    puts("1. Add Bus")
    puts("2. Remove Bus")
    puts("3. Add Stop")
    puts("4. Remove Stop")
    puts("5. Add Route")
    puts("6. Remove Route")
    puts("7. Add Line")
    puts("8. Remove Line")
    puts("9. Exit")
    print("Please select an option using the number : ")
  end
end