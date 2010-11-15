package Books::Result::Genre;

use DBIx::Class::Candy;
  
table 'genre';
  
column 'id' => {
	data_type         => 'int',
    is_auto_increment => 1,
};
  
column 'name' => {
	data_type => 'varchar',
	size      => 256,
};
  
column 'fiction' => {
	data_type => 'boolean',
};

primary_key 'id';
  
many_to_many 'books' => ( 'Books::Result::Book', 'genre_id' );

1;
