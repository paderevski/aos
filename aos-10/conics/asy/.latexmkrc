add_cus_dep('sagetex.sage', 'sagetex.sout', 0, 'makesout');
$hash_calc_ignore_pattern{'sage'} = '^( _st_.goboom| ?_st_.current_tex_line|print .SageT)';
sub makesout {
    system("sage '$_[0].sagetex.sage'");
}