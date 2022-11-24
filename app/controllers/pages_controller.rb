class PagesController < ApplicationController
  def home
   @sneakers = Sneaker.all
  end
end
