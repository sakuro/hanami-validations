require 'test_helper'

describe 'Predicates: Max Size' do
  include TestUtils

  describe 'with required' do
    before do
      @validator = Class.new do
        include Hanami::Validations

        validations do
          required(:foo) { max_size?(3) }
        end
      end
    end

    describe 'with valid input' do
      let(:input) { { foo: [1, 2, 3] } }

      it 'is successful' do
        assert_successful result
      end
    end

    describe 'with missing input' do
      let(:input) { {} }

      it 'is not successful' do
        refute_successful result, ['is missing', 'size cannot be greater than 3']
      end
    end

    describe 'with nil input' do
      let(:input) { { foo: nil } }

      it 'is raises error' do
        -> { result }.must_raise(NoMethodError)
      end
    end

    describe 'with blank input' do
      let(:input) { { foo: '' } }

      it 'is successful' do
        assert_successful result
      end
    end

    describe 'with invalid input' do
      let(:input) { { foo: { a: 1, b: 2, c: 3, d: 4 } } }

      it 'is not successful' do
        refute_successful result, ['size cannot be greater than 3']
      end
    end
  end

  describe 'with optional' do
    before do
      @validator = Class.new do
        include Hanami::Validations

        validations do
          optional(:foo) { max_size?(3) }
        end
      end
    end

    describe 'with valid input' do
      let(:input) { { foo: [1, 2, 3] } }

      it 'is successful' do
        assert_successful result
      end
    end

    describe 'with missing input' do
      let(:input) { {} }

      it 'is successful' do
        assert_successful result
      end
    end

    describe 'with nil input' do
      let(:input) { { foo: nil } }

      it 'is raises error' do
        -> { result }.must_raise(NoMethodError)
      end
    end

    describe 'with blank input' do
      let(:input) { { foo: '' } }

      it 'is successful' do
        assert_successful result
      end
    end

    describe 'with invalid input' do
      let(:input) { { foo: { a: 1, b: 2, c: 3, d: 4 } } }

      it 'is not successful' do
        refute_successful result, ['size cannot be greater than 3']
      end
    end
  end

  describe 'as macro' do
    describe 'with required' do
      describe 'with value' do
        before do
          @validator = Class.new do
            include Hanami::Validations

            validations do
              required(:foo).value(max_size?: 3)
            end
          end
        end

        describe 'with valid input' do
          let(:input) { { foo: [1, 2, 3] } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with missing input' do
          let(:input) { {} }

          it 'is not successful' do
            refute_successful result, ['is missing', 'size cannot be greater than 3']
          end
        end

        describe 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is not successful' do
            -> { result }.must_raise(NoMethodError)
          end
        end

        describe 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with invalid input' do
          let(:input) { { foo: { a: 1, b: 2, c: 3, d: 4 } } }

          it 'is not successful' do
            refute_successful result, ['size cannot be greater than 3']
          end
        end
      end

      describe 'with filled' do
        before do
          @validator = Class.new do
            include Hanami::Validations

            validations do
              required(:foo).filled(max_size?: 3)
            end
          end
        end

        describe 'with valid input' do
          let(:input) { { foo: [1, 2, 3] } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with missing input' do
          let(:input) { {} }

          it 'is not successful' do
            refute_successful result, ['is missing', 'size cannot be greater than 3']
          end
        end

        describe 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is not successful' do
            refute_successful result, ['must be filled', 'size cannot be greater than 3']
          end
        end

        describe 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is not successful' do
            refute_successful result, ['must be filled', 'size cannot be greater than 3']
          end
        end

        describe 'with invalid input' do
          let(:input) { { foo: { a: 1, b: 2, c: 3, d: 4 } } }

          it 'is not successful' do
            refute_successful result, ['size cannot be greater than 3']
          end
        end
      end

      describe 'with maybe' do
        before do
          @validator = Class.new do
            include Hanami::Validations

            validations do
              required(:foo).maybe(max_size?: 3)
            end
          end
        end

        describe 'with valid input' do
          let(:input) { { foo: [1, 2, 3] } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with missing input' do
          let(:input) { {} }

          it 'is not successful' do
            refute_successful result, ['is missing', 'size cannot be greater than 3']
          end
        end

        describe 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with invalid input' do
          let(:input) { { foo: { a: 1, b: 2, c: 3, d: 4 } } }

          it 'is not successful' do
            refute_successful result, ['size cannot be greater than 3']
          end
        end
      end
    end

    describe 'with optional' do
      describe 'with value' do
        before do
          @validator = Class.new do
            include Hanami::Validations

            validations do
              optional(:foo).value(max_size?: 3)
            end
          end
        end

        describe 'with valid input' do
          let(:input) { { foo: [1, 2, 3] } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with missing input' do
          let(:input) { {} }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is raises error' do
            -> { result }.must_raise(NoMethodError)
          end
        end

        describe 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with invalid input' do
          let(:input) { { foo: { a: 1, b: 2, c: 3, d: 4 } } }

          it 'is not successful' do
            refute_successful result, ['size cannot be greater than 3']
          end
        end
      end

      describe 'with filled' do
        before do
          @validator = Class.new do
            include Hanami::Validations

            validations do
              optional(:foo).filled(max_size?: 3)
            end
          end
        end

        describe 'with valid input' do
          let(:input) { { foo: [1, 2, 3] } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with missing input' do
          let(:input) { {} }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is not successful' do
            refute_successful result, ['must be filled', 'size cannot be greater than 3']
          end
        end

        describe 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is not successful' do
            refute_successful result, ['must be filled', 'size cannot be greater than 3']
          end
        end

        describe 'with invalid input' do
          let(:input) { { foo: { a: 1, b: 2, c: 3, d: 4 } } }

          it 'is not successful' do
            refute_successful result, ['size cannot be greater than 3']
          end
        end
      end

      describe 'with maybe' do
        before do
          @validator = Class.new do
            include Hanami::Validations

            validations do
              optional(:foo).maybe(max_size?: 3)
            end
          end
        end

        describe 'with valid input' do
          let(:input) { { foo: [1, 2, 3] } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with missing input' do
          let(:input) { {} }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is successful' do
            assert_successful result
          end
        end

        describe 'with invalid input' do
          let(:input) { { foo: { a: 1, b: 2, c: 3, d: 4 } } }

          it 'is not successful' do
            refute_successful result, ['size cannot be greater than 3']
          end
        end
      end
    end
  end
end
