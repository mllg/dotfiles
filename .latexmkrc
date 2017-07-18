$bibtex_use = 2;
$clean_ext = 'synctex.gz synctex.gz run.xml tex.bak bbl bcf fdb_latexmk snm -concordance.tex brf nav vrb';

if(grep(/\.(rnw|rtex)$/i, @ARGV)) {
    $latex = 'internal knitrlatex ' . $latex;
    $pdflatex = 'internal knitrlatex ' . $pdflatex;
    my $knitr_compiled = {};
    sub knitrlatex {
        for (@_) {
            next unless -e $_;
            my $input = $_;
            next unless $_ =~ s/\.(rnw|rtex)$/.tex/i;
            my $tex = $_;
            my $checksum = (fdb_get($input))[-1];
            if (!$knitr_compiled{$input} || $knitr_compiled{$input} ne $checksum) {
                my $ret = system("Rscript -e \"knitr::knit('$input')\"");
                if($ret) { return $ret; }
                rdb_ensure_file($rule, $tex);
                $knitr_compiled{$input} = $checksum;
            }
        }
        return system(@_);
    }
    # clean up generated .tex file when running `latexmk -c <root_file>`
    $clean_ext .= ' %R.tex';
}
