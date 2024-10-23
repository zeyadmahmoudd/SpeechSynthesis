function lpc_spectrum(H, F)
 plot(F, 20*log10(abs(H)), 'r');
 legend('Speech Spectrum', 'LPC Frequebcy Response');
 grid on;
end