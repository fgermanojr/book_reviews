FactoryBot.define do
  factory :book do
    title { 'Quantum Man' }
    author { 'Lawrence M. Krauss' }
    publication_year { '2011' }
    isbn { 'ISBN 978-0-393-06471-1' } 
  end
end
