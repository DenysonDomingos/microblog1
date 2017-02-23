module Features

  def sign_in(author)
    visit new_author_session_path
    fill_in "Email", with: author.email
    fill_in "Password", with: author.password
    click_on "Log in"
  end
end
