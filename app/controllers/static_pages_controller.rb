class StaticPagesController < ApplicationController
  def example1
    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.series(:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12 ,3, 5,6,7,7,80,9,9])
      f.series(:name=>'Jane', :data=> [1, 3, 4, 3, 3, 5, 4,-46,7,8,8,9,9,0,0,9] )
    end 
  end

  def example2
    # define valid characters
    pwchars = Array.new
    pwchars[0] = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    pwchars[1] = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
    pwchars[2] = %w(1 2 3 4 5 6 7 8 9 0)
    pwchars[3] = %w(- _ ; : ( ) % & $ §)
    
    # shuffle indexes for accessing character set with random order
    char_set_ids = Array.new
    char_set_ids = [0, 1, 2, 3]
    char_set_ids = char_set_ids.shuffle

    # counter for reshuffle of character set indexes
    count = 0

    # read length for password generation from view or set it to 8, if not available from view
    quantity = params[:quantity].to_i

    if quantity
      q = quantity
    else
      q = 8
    end

    # initialize random string variable
    @r = ''

    # create random password string with length = q
    q.times do

      # check if character was already used in this password, if so, create new random character
      unique = false
      while unique == false do
        # access character set with shuffeled index between 0 and 3 and access random array value
        char = pwchars[char_set_ids[count]].sample
        if not @r.include? char
          @r << char
          unique = true
        end
      end

      # reshuffle ids
      if count == 3
        count = 0
        char_set_ids = char_set_ids.shuffle
      else
        count = count + 1
      end

    end
  end

  def example3
  end
end
