package Books::Result::Address;
  
use DBIx::Class::Candy;
  
table 'address';

column 'id' => {
	data_type         => 'int',
    is_auto_increment => 1,
};
  
column 'country' => {
	data_type   => 'varchar',
	size        => 256,
	is_nullable => 1,
};

column 'city' => {
	data_type   => 'varchar',
	size        => 256,
	is_nullable => 1,
};

column 'street' => {
	data_type  => 'varchar',
	size        => 1000,
	is_nullable => 1,
};

column 'author_id' => {
	data_type      => 'int',
	is_foreign_key => 1,
};

primary_key 'id';

belongs_to 'author' => ( 'Books::Result::Author', 'author_id' );

1;
