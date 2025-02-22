{include file="sections/header.tpl"}

<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-hovered mb20 panel-primary">
			<div class="panel-heading">{Lang::T('Bandwidth Plans')}</div>
			<div class="panel-body">
				<div class="md-whiteframe-z1 mb20 text-center" style="padding: 15px">
					
					<div class="col-md-4">
						<a href="{$_url}bandwidth/add" class="btn btn-primary btn-block"><i class="ion ion-android-add">
							</i> {Lang::T('New Bandwidth')}</a>
					</div>&nbsp;
				</div>
				<div class="table-responsive">
					<table class="table table-bordered table-condensed table-striped table_mobile">
						<thead>
							<tr>
								<th>{Lang::T('Bandwidth Name')}</th>
								<th>{Lang::T('Rate')}</th>
								<th>Burst</th>
								<th>{Lang::T('Manage')}</th>
							</tr>
						</thead>
						<tbody>
							{foreach $d as $ds}
								<tr>
									<td>{$ds['name_bw']}</td>
									<td>{$ds['rate_down']} {$ds['rate_down_unit']} / {$ds['rate_up']} {$ds['rate_up_unit']}
									</td>
									<td>{$ds['burst']}</td>
									<td>
										<a href="{$_url}bandwidth/edit/{$ds['id']}"
											class="btn btn-sm btn-warning">{Lang::T('Edit')}</a>
										<a href="{$_url}bandwidth/delete/{$ds['id']}" id="{$ds['id']}"
											class="btn btn-danger btn-sm"
											t
											onclick="return ask(this, '{Lang::T('Delete')}?')"><i
												class="glyphicon glyphicon-trash"></i></a>
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
				{include file="pagination.tpl"}

			</div>
		</div>
	</div>
</div>
</div>

{include file="sections/footer.tpl"}