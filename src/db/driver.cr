module DB
  # Database driver implementors must subclass `Driver`,
  # register with a driver_name using `DB#register_driver` and
  # override the factory method `#build_connection`.
  #
  # ```
  # require "db"
  #
  # class FakeDriver < Driver
  #   def build_connection
  #     FakeConnection.new uri
  #   end
  # end
  #
  # DB.register_driver "fake", FakeDriver
  # ```
  #
  # Access to this fake datbase will be available with
  #
  # ```
  # DB.open "fake", "..." do |db|
  #   # ... use db ...
  # end
  # ```
  #
  # Refer to `Connection`, `Statement` and `ResultSet` for further
  # driver implementation instructions.
  abstract class Driver
    getter uri

    def initialize(@uri : URI)
    end

    abstract def build_connection : Connection
  end
end
