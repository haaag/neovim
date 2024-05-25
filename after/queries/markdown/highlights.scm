extends
(list_item [
  (list_marker_plus)
  (list_marker_minus)
  (list_marker_star)
  (list_marker_dot)
  (list_marker_parenthesis)
] @conceal [
    (task_list_marker_checked)
    (task_list_marker_unchecked)
](#set! conceal ""))

((task_list_marker_checked) @conceal (#set! conceal ""))
((task_list_marker_unchecked) @conceal (#set! conceal ""))

(fenced_code_block (info_string) @MDTSFencedCodeBlockInfo) @MDTSFencedCodeBlock
(fenced_code_block_delimiter) @MDTSFencedCodeBlock
(
    (atx_heading (atx_h1_marker)) @OrgTSHeadlineLevel1
    (set! "priority" 2050)
)
(
    (atx_heading (atx_h2_marker)) @OrgTSHeadlineLevel2
    (set! "priority" 2050)
)
(
    (atx_heading (atx_h3_marker)) @OrgTSHeadlineLevel3
    (set! "priority" 2050)
)
(
    (atx_heading (atx_h4_marker)) @OrgTSHeadlineLevel4
    (set! "priority" 2050)
)
(
    (atx_heading (atx_h5_marker)) @OrgTSHeadlineLevel5
    (set! "priority" 2050)
)
