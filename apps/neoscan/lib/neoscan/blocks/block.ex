defmodule Neoscan.Block do
  @moduledoc """
  Represent a Block in Database
  """

  use Ecto.Schema
  alias Neoscan.Transaction

  @primary_key {:hash, :binary, []}
  @foreign_key_type :binary
  schema "blocks" do
    field(:index, :integer)
    field(:merkle_root, :binary)
    field(:next_consensus, :binary)
    field(:nonce, :binary)
    field(:script, {:map, :string})
    field(:size, :integer)
    field(:time, :utc_datetime)
    field(:lag, :integer, virtual: true)
    field(:version, :integer)
    field(:tx_count, :integer)
    field(:total_sys_fee, :decimal)
    field(:total_net_fee, :decimal)
    field(:gas_generated, :decimal)
    has_many(:transactions, Transaction, foreign_key: :block_hash, references: :hash)

    timestamps()
  end
end
