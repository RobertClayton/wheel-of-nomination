class SpinsController < ApplicationController
  def index
    @users = present_users.sort_by { |user| user.name }
    @names = shuffle_names
    @entries = calculated_entries.sort_by { |entry| entry[:entries] }.reverse
    @total_entries = @entries.map { |entry| entry[:entries] }.reduce('+')
  end

  private

  def shuffle_names
    name_list.shuffle[..11]
  end

  def name_list
    calculated_entries.each_with_object([]) do |calculated_entry, list|
      calculated_entry[:entries].times do
        list << calculated_entry[:name]
      end
    end
  end

  def calculated_entries
    nominations = Nomination.all.sort_by(&:date).reverse

    present_users.map do |user|
      {
        name: user.name,
        entries: nominations.index { |nomination| nomination.user == user } || User.count / 2
      }
    end
  end

  def present_users
    @present_users ||= User.all.where(id: user_ids)
  end

  def user_ids
    return User.all.pluck(:id) if params[:user_ids].nil?

    params[:user_ids].map(&:to_i)
  end
end
