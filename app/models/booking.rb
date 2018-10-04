class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :matched_user, class_name: "User"
  has_one :listing

  validate :asynchrony?

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_match_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_match_options)
  end

  def inverses
    self.class.where(inverse_match_options)
  end

  def inverse_match_options
    { matched_user_id: user_id, user_id: matched_user_id }
  end

  def asynchrony?
    if self.listing_id
      @@listing_id = self.listing_id
      @@check_in_date = self.check_in_date
      @@check_out_date = self.check_out_date
      @@price = Listing.find(self.listing_id).price
    else

      self.check_in_date = @@check_in_date
      self.check_out_date = @@check_out_date
      self.listing_id = @@listing_id
      @@price = Listing.find(self.listing_id).price

    end

      in_date = self.check_in_date.split("/")
      in_year = in_date[-1]
      in_month = in_date[0]
      in_day = in_date[1]
      out_date = self.check_out_date.split("/")
      out_year = out_date[-1]
      out_month = out_date[0]
      out_day = out_date[1]




    if out_year < in_year || out_year == in_year && out_month < in_month ||
      out_year == in_year && out_month == in_month && out_day < in_day
      errors.add(:check_in_date, "cannot be later than your check out date")

    else
      
        total = @@price * ((out_year.to_i - in_year.to_i) * 365) + ((out_month.to_i - in_month.to_i) * 30) + (out_day.to_i - in_day.to_i)
        self.total = total
    end
  end

end
