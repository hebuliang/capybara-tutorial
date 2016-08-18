module PageWithAllPosts
  include Gizmo::PageMixin

  def valid?
    has_css?('.parent .right')
  end

  def tips
    find('.tips')
  end

  def latest_posted_item
    find('ul.top-10-list > li')
  end
end