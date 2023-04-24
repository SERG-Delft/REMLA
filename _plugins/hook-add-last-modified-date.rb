# inspired by https://stackoverflow.com/a/36769049/3617482

Jekyll::Hooks.register :pages, :post_init do |page|

  if File.exists?(page.path) and page.path.end_with?(".md") then

    # get the current page last modified time
    modification_time = File.mtime( page.path )

    # inject modification_time in page's datas.
    page.data['last-modified-date'] = modification_time
  end
end