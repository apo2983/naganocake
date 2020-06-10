class Public::EndUsersController < ApplicationController
  def show

  end

  def edit
  end

  def update
    if current_end_user.update(end_user_params)
      redirect_to end_users_path,notice:"登録情報を編集しました。"
    else render 'end_users/edit'
    end
  end

  def leave
  end

  def withdrawal
    current_end_user.update(is_valid: false)
    reset_session
    redirect_to root_path,notice:"ありがとうございました。またのご利用を心よりお待ちしています。"
  end

  private
  def end_user_params
    params.require(:end_user).permit(:last_name,:first_name,
      :last_name_kana,:first_name_kana,:email,:postal_code,:address,:phone_number)
  end
end
