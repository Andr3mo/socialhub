class Search < ApplicationRecord
  def search_tickets
    tickets = Ticket.all

    tickets = tickets.where(['name LIKE ?', "%#{keywords}%"]) if keywords.present?
    tickets = tickets.where(['category_id LIKE ?', category]) if category.present?
    tickets = tickets.where(['price >= ?', min_price]) if min_price.present?
    tickets = tickets.where(['price <= ?', max_price]) if max_price.present?

    return tickets
  end
end
