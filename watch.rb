def run_all_specs
  system "clear && date && rake spec"
end

watch('spec/.*_spec\.rb') { run_all_specs }
watch('lib/.*\.rb') { run_all_specs }
