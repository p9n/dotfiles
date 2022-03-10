let s:cros_kernel_style_path = [
  \ '*/{vboot_reference,depthcharge,coreboot,ec}/*.[ch]',
  \ '*/third_party/kernel/*.[ch]',
  \ '*.dts',
  \ '*.dtsi',
  \ 'Kconfig*',
  \ ]

exe 'au BufRead,BufNewFile ' . join(s:cros_kernel_style_path, ',') .
  \ ' setl noexpandtab nosmarttab tabstop=8 shiftwidth=8 softtabstop=8'

au BufRead,BufNewFile */ec/Makefile.* set ft=make
