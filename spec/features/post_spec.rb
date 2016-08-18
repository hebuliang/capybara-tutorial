require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'
    on_page_with :post_list do |page|
      page.create_post_link.click
    end

    on_page_with :new_post do |page|
      page.perform :fill_post, 'This is my first post.', 'I wanna be the full-stack dev.'
      page.create_post_button.click
    end

    on_page_with :post_notice do |page|
      expect(page.notice_message).to eq('Post was successfully created.')
      page.back_link.click
    end

    on_page_with :all_posts, :post_list do |page|
      expect(page.posts_in_list.length).to eq(1)
      expect(page.tips).not_to have_content('start load...')
      expect(page.latest_posted_item).to have_content('This is my first post.')
    end
  end
end
