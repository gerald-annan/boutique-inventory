defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    # Enum.sort(inventory, fn item1, item2 -> item1.price <= item2.price end)
    Enum.sort_by(inventory, & &1.price, :asc)
  end

   def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price == nil end)
  end

  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn map ->
      Enum.map(map, fn {k, v} -> {k, v + count} end) |> Enum.into(%{})
    end)
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_, v}, acc ->
      acc + v
    end)
  end
end
