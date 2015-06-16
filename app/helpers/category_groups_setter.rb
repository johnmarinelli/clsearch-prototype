module CategoryGroupsSetter
  def set_category_groups
    @category_groups = CategoryGroupReference.all
    @category_groups.map { |g| g['code'] = '' if g['name'] == 'Uncategorized' }
  end
end
