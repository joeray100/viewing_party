class TailwindFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, opts={})
    default_opts = { class: "mt-2 block w-auto rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" }
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts)
  end

  def password_field(method, opts={})
    default_opts = { class: "mt-2 block w-auto rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" }
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts)
  end

  def submit(method, opts={})
    default_opts = { class: "mt-5 py-4 px-6 w-full border-2 border-blue-400 hover:bg-blue-400 hover:text-white rounded" }
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts)
  end
end
