module PageWithPostNotice
  include Gizmo::PageMixin

  def valid?
    has_css?('#notice')
  end

  def notice_message
  	find('#notice').text
  end

  def back_link
    find('a[href="/posts"]')
  end
end