\version "1.7.18"
% regression or delete.  -gp
\header{ texidoc=" REGRESSION or DELETE. "}

\score{
	\notes\relative c''{
		\time 2/4
		e2(
		\break
		 e4-) f,(\break
		 f4-) f(\break
		a2\break
		 e'2-)
	}
	\paper{
		linewidth = 60.\mm
	}
}
%% new-chords-done %%
