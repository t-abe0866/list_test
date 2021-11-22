module ApplicationHelper
  def sort_asc(column_to_be_sorted)
    link_to "▲", {sort_item: column_to_be_sorted, sort_order: "asc"}
  end

  def sort_desc(column_to_be_sorted)
    link_to "▼", {sort_item: column_to_be_sorted, sort_order: "desc"}
  end
end
