# -*- encoding: utf-8 -*-
class AdminController < ApplicationController
	layout 'admin'

  before_filter :check_is_user_admin_or_mod


  def index
  end

  def check_is_user_admin_or_mod
    unless user_signed_in? && (current_user.role == 'admin' || current_user.role == 'mod')
      redirect_to root_url, alert: 'Nie masz uprawnień aby używać tej części serwisu. Zaloguj się na konto z odpowiednimi prawami.'
    end
  end

  def check_is_user_admin
    unless user_signed_in? && current_user.role == 'admin'
      redirect_to admin_url, alert: 'Nie masz uprawnień aby tej części Panelu Administracyjnego. Zaloguj się na konto z odpowiednimi prawami.'
    end
  end
end
  