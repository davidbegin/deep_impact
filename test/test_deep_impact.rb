require 'minitest_helper'

class TestDeepImpact < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::DeepImpact::VERSION
  end

  def test_it_returns_a_string_when_passed_a_string
    assert_equal DeepImpact.stringify("hello"), "hello"
  end

  def test_it_returns_a_string_when_passed_an_integer
    assert_equal DeepImpact.stringify(1), "1"
  end

  def test_it_returns_a_string_when_passed_a_boolean
    assert_equal DeepImpact.stringify(true), "true"
    assert_equal DeepImpact.stringify(false), "false"
  end

  def test_it_handles_arrays_of_integers
    assert_equal DeepImpact.stringify([1, 2, 3]), ["1", "2", "3"]
  end

  def test_it_handles_hashes
    assert_equal DeepImpact.stringify({"a" => 1, "j" => true}),
      {"a" => "1", "j" => "true"}
  end

  def test_it_handles_nested_arrays_and_hashes
    og_hash = {
      :a => [1, true, :hello], :b => { :c => [{:d => 1}]}
    }
    transformed_hash = {
      "a" => ["1", "true", "hello"], "b" => { "c" => [{"d" => "1"}]}
    }
    assert_equal DeepImpact.stringify(og_hash), transformed_hash
  end

end
