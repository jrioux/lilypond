\version "1.7.18"
% regression or delete.  -gp
\header {texidoc = "REGRESSION or DELETE. "} 
\score{
	\notes{
		c( d e  c-) |
		\slurDotted
		c( d e  c-) |
		\slurSolid
		c( d e  c-) |
		\property Voice. Slur \set #'dashed = #0.0
		c( d e  c-) |
		\slurSolid
		c( d e  c-) |
	}
	\paper{ 
	      indent = 0.0\pt
		%for broken!
		% linewidth= 30.\mm

	}
}


%% new-chords-done %%
