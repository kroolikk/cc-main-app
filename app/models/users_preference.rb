# -*- encoding: utf-8 -*-
class UsersPreference < ActiveRecord::Base
  attr_protected :id

  belongs_to :user
  belongs_to :preference
end
