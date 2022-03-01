import os
import glob

import scipy
import scipy.io.wavfile
from scipy import fftpack
import matplotlib.pyplot as plt

def plot_wav_fft(wav_filename, desc=None, trans=False):
    plt.clf()
    plt.figure(num=None, figsize=(6, 4))
    sample_rate, X = scipy.io.wavfile.read(wav_filename)
    spectrum = fftpack.fft(X)
    freq = fftpack.fftfreq(len(X), d=1.0 / sample_rate)

    plt.subplot(211)
    num_samples = 300.0
    plt.xlim(0, num_samples / sample_rate)
    plt.xlabel("time [s]")
    plt.title(desc or wav_filename)
    plt.plot(np.arange(num_samples) / sample_rate, X[:num_samples])
    plt.grid(True)

    if trans:
        plt.subplot(212)
        plt.xlim(0, 5000)
        plt.xlabel("frequency [Hz]")
        plt.xticks(np.arange(5) * 4000)
        if desc:
            desc = desc.strip()
            fft_desc = desc[0].lower() + desc[1:]
        else:
            fft_desc = wav_filename
            plt.title("FFT of %s" % fft_desc)
            plt.plot(freq, abs(spectrum), linewidth=2)
            plt.grid(True)
            plt.tight_layout()

    rel_filename = os.path.split(wav_filename)[1]
    plt.savefig("%s_wav_fft.png" % os.path.splitext(rel_filename)[0],
    bbox_inches='tight')


    plt.show()


def plot_wav_fft_demo():
    plot_wav_fft("sine_300.wav")
    plot_wav_fft("sine_10000.wav")
    plot_wav_fft("sine_mix.wav")

    plot_wav_fft_demo()
