# Be sure to restart your server when you modify this file.

# Backtrace silencer

# Upon encountering an error or failing test, the test runner shows a “stack trace” or “backtrace” that traces the course of a failed test through the application. While this backtrace is usually very useful for tracking down the problem, on some systems it goes past the application code and into the various gem dependencies, including Rails itself. The resulting backtrace is often inconveniently long, especially since the source of the problem is usually the application and not one of its dependencies.

# The solution is to filter the backtrace to eliminate unwanted lines. This requires the mini_backtrace gem combined with a backtrace silencer.

# You can add backtrace silencers for libraries that you're using but don't wish to see in your backtraces.
# Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }
Rails.backtrace_cleaner.add_silencer { |line| line =~ /rvm/ }

# You can also remove all the silencers if you're trying to debug a problem that might stem from framework code.
# Rails.backtrace_cleaner.remove_silencers!
