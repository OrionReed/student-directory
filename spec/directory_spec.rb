require "directory"

describe "directory" do
  describe 'show options' do
    it 'lists possible options' do
      expect do
        show_options
      end.to output(
      '1. Input the students
2. Show the students
3. Save the list to students.csv
4. Load the list from students.csv
9. Exit').to_stdout
    end
  end
end
