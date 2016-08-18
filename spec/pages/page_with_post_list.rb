module PageWithPostList
	include Gizmo::PageMixin

	def valid?
		has_css?('.parent .left')
	end

  def create_post_link
		find_link('New Post')
	end

	def posts_in_list
		find('.parent .left table').find('tbody').all('tr')
	end
end